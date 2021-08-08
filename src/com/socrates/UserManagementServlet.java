package com.socrates;

import javax.servlet.http.*;
import javax.servlet.*;  
import java.io.*;
import java.sql.*;


public class UserManagementServlet extends HttpServlet {

	public Connection getConnection() throws SQLException, ClassNotFoundException {
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/";
		// Database name to access
		String dbName = "socrates";
		String dbUsername = "root";
		String dbPassword = "";
		Class.forName(dbDriver);
		return DriverManager.getConnection(dbURL + dbName,
				dbUsername,
				dbPassword);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletPath();
		response.setContentType("text/html");//setting the content type
		switch (path) {
			case "/register" : {
				//Get the request parameters
				String fullName = request.getParameter("name");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String email = request.getParameter("email");
				try {
					PrintWriter printWriter = response.getWriter();//get the stream to write the data
					Connection connection = getConnection();
					PreparedStatement statement = connection.prepareStatement("insert into login (user_name, password) values(?, ?)",
							Statement.RETURN_GENERATED_KEYS);
					statement.setString(1, username);
					statement.setString(2, password);
					statement.executeUpdate(); //Insert the credential data into DB
					ResultSet resultSet = statement.getGeneratedKeys();
					resultSet.next();
					int userID = resultSet.getInt(1); // Get the userID (Auto-incremented value)
					printWriter.println("Your username is " + username);
					statement.close();
					statement = connection.prepareStatement("insert into users values(?, ?, ?)");
					statement.setInt(1, userID);
					statement.setString(2, fullName);
					statement.setString(3, email);
					statement.executeUpdate(); // Insert the user data
					connection.close();
					printWriter.println("<br>Successfully Registered<br/><br/><input type=\"button\" Value=\"Back to login\" onclick=\"location.href = 'index.jsp';\" />");
					printWriter.close();

				} catch (Exception ex) {
					ex.printStackTrace();
					try {
						RequestDispatcher dispatcher = request.getRequestDispatcher("/error");
						request.setAttribute("errorMessage", "Error while registering...Try with another userID");
						dispatcher.forward(request, response); // Forward the request to Home page
					}
					catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			break;
			case "/login" : {
				try {
					//Get the request parameters
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					String userFromDB;
					String passwordFromDB = null;
					int userID = 0;
					Connection connection = getConnection();
					String query = "select * from login";
					try (Statement statement = connection.createStatement()) {
						ResultSet resultSet = statement.executeQuery(query);
						while (resultSet.next()) {
							// Find if username is present in DB
							userFromDB = resultSet.getString("user_name");
							if (userFromDB.equals(username.trim())) {
								// If the user is present, fetch password from DB
								passwordFromDB = resultSet.getString("password");
								userID = resultSet.getInt("user_id");
								break;
							}
						}
					}
					if (passwordFromDB != null && passwordFromDB.equals(password)) {
						// If password is matched, set the user details in attribute& forward the request to Home page
						String name;
						String email;
						String userQuery = "select * from users where user_id = " + userID;
						try (Statement statement = connection.createStatement()) {
							ResultSet resultSet = statement.executeQuery(userQuery);
							if (resultSet.next()) {
								name = resultSet.getString("name");
								email = resultSet.getString("email");
								request.setAttribute("name", name);
								request.setAttribute("email", email);
								request.setAttribute("user_id", userID);
							}
						}
						connection.close();
						RequestDispatcher dispatcher = request.getRequestDispatcher("/userHome");
						dispatcher.forward(request, response); // Forward the request to Home page
					} else {
						RequestDispatcher dispatcher = request.getRequestDispatcher("/error");
						request.setAttribute("errorMessage", "Invalid credentials");
						dispatcher.forward(request, response); // Forward the request to Home page
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