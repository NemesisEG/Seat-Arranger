package com.developer.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			

			try {
			    Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false", "root", "root");

			    // Fetch the old password from the database
			    PreparedStatement fetchOldPasswordStmt = con.prepareStatement("SELECT upwd FROM users WHERE uemail = ?");
			    fetchOldPasswordStmt.setString(1, (String) session.getAttribute("email"));
			    ResultSet resultSet = fetchOldPasswordStmt.executeQuery();

			    if (resultSet.next()) {
			        String storedOldPassword = resultSet.getString("upwd");

			        // Check if the entered old password matches the stored old password
			        if (storedOldPassword.equals(oldPassword)) {
			            // If the old password is correct, proceed to update the password
			            PreparedStatement updatePasswordStmt = con.prepareStatement("UPDATE users SET upwd = ? WHERE uemail = ?");
			            updatePasswordStmt.setString(1, newPassword);
			            updatePasswordStmt.setString(2, (String) session.getAttribute("email"));

			            int rowCount = updatePasswordStmt.executeUpdate();
			            if (rowCount > 0) {
			                request.setAttribute("status", "resetSuccess");
			                dispatcher = request.getRequestDispatcher("profile.jsp");
			            } else {
			                request.setAttribute("status", "resetFailed");
			                dispatcher = request.getRequestDispatcher("login.jsp");
			            }
			        } else {
			            // If the old password is incorrect, handle accordingly (e.g., show an error message)
			            request.setAttribute("status", "oldPasswordIncorrect");
			            dispatcher = request.getRequestDispatcher("yourErrorPage.jsp");
			        }
			    }

			    dispatcher.forward(request, response);
			} catch (Exception e) {
			    e.printStackTrace();
			}

			

		
	}

	}
	}
