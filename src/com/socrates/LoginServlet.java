package com.socrates;

import javax.servlet.http.*;
import javax.servlet.*;  
import java.io.*;
import java.sql.*;


public class LoginServlet extends HttpServlet {

	public Connection getConnection() throws Exception {
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql:// localhost:3306/";
		// Database name to access
		String dbName = "socrates";
		String dbUsername = "root";
		String dbPassword = "";
		Class.forName(dbDriver);
		return DriverManager.getConnection(dbURL + dbName,
				dbUsername,
				dbPassword);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		String path = req.getServletPath();
		res.setContentType("text/html");//setting the content type
		PrintWriter pw = res.getWriter();//get the stream to write the data
		switch (path) {
			case "/register" : {
				String fullName = req.getParameter("name");
				String username = req.getParameter("username");
				String password = req.getParameter("password");
				String email = req.getParameter("email");
				try {
					Connection con = getConnection();
					PreparedStatement st = con.prepareStatement("insert into login (user_name, password) values(?, ?)",
							Statement.RETURN_GENERATED_KEYS);
					st.setString(1, username);
					st.setString(2, password);
					st.executeUpdate();
					ResultSet rs = st.getGeneratedKeys();
					rs.next();
					int userID = rs.getInt(1);
					pw.println("Your username is " + username);
					st.close();
					st = con.prepareStatement("insert into users values(?, ?, ?)");
					st.setInt(1, userID);
					st.setString(2, fullName);
					st.setString(3, email);
					st.executeUpdate();
					con.close();
					pw.println("<br>Successfully Registered<br/><br/><input type=\"button\" Value=\"Back to login\" onclick=\"location.href = 'index.jsp';\" />");
					pw.close();

				} catch (Exception ex) {
					ex.printStackTrace();
					pw.println("Error while registering...Try with another userID<br/><br/><input type=\"button\" Value=\"Back to Registration page\" onclick=\"location.href = 'registration';\" />");
					pw.close();
				}
			}
			break;
			case "/login" : {
				try {
					String username = req.getParameter("username");
					String password = req.getParameter("password");
					String userFromDB;
					String passwordFromDB = null;
					int userID = 0;
					Connection connection = getConnection();
					String query = "select * from login";
					try (Statement stmt = connection.createStatement()) {
						ResultSet rs = stmt.executeQuery(query);
						while (rs.next()) {
							userFromDB = rs.getString("user_name");
							if (userFromDB.equals(username.trim())) {
								passwordFromDB = rs.getString("password");
								userID = rs.getInt("user_id");
								break;
							}
						}
					}
					if (passwordFromDB != null && passwordFromDB.equals(password)) {
						String name;
						String email;
						String userQuery = "select * from users where user_id = " + userID;
						try (Statement stmt = connection.createStatement()) {
							ResultSet rs = stmt.executeQuery(userQuery);
							if (rs.next()) {
								name = rs.getString("name");
								email = rs.getString("email");
								req.setAttribute("name", name);
								req.setAttribute("email", email);
								req.setAttribute("user_id", userID);
							}
						}
						connection.close();
						RequestDispatcher dispatcher = req.getRequestDispatcher("/userHome");
						dispatcher.forward(req, res);
					} else {
						pw.println("Invalid credentials<br/><br/><input type=\"button\" Value=\"Back to login page\" onclick=\"location.href = 'index.jsp';\" />");
						pw.close();
						connection.close();
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			break;
		}
	}
}