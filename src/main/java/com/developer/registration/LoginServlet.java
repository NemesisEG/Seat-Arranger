package com.developer.registration;

import java.io.IOException;
import java.sql.DriverManager;
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

import com.mysql.cj.xdevapi.Result;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	 String uemail=request.getParameter("username");
	 String upwd=request.getParameter("password");
	 HttpSession session = request.getSession();	 
	 RequestDispatcher dispatcher = null;
	 if(uemail == null || uemail.equals("")) {
		 request.setAttribute("status", "invalidEmail");
		 dispatcher =request.getRequestDispatcher("login.jsp");
		 dispatcher.forward(request, response);
	 }
	 if(upwd == null || upwd.equals("")) {
		 request.setAttribute("status", "invalidUpwd");
		 dispatcher =request.getRequestDispatcher("login.jsp");
		 dispatcher.forward(request, response);
	 }
	 try {
		 Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","Piano004");
		PreparedStatement pst= con.prepareStatement("select * from users where uemail = ? and upwd = ?");
		pst.setString(1, uemail);
		pst.setString(2, upwd);
		
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()) {
			session.setAttribute("role", rs.getString("role"));
			session.setAttribute("semester", rs.getInt("semester"));
			session.setAttribute("department", rs.getString("department"));
			session.setAttribute("mobile", rs.getString("umobile"));
			session.setAttribute("email", rs.getString("uemail"));
			session.setAttribute("name", rs.getString("uname"));
			dispatcher = request.getRequestDispatcher("index.jsp");			
		}
		else {
			request.setAttribute("status", "Failed");
			dispatcher = request.getRequestDispatcher("login.jsp");		
		}
		dispatcher.forward(request, response);

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}

}
