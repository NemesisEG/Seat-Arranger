package com.developer.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
	String uname=request.getParameter("name"); 
	String uemail=request.getParameter("email"); 
	String upwd=request.getParameter("pass");
	String reupwd=request.getParameter("re_pass");
	String umobile=request.getParameter("contact"); 
	String department = request.getParameter("department");
	String semester = request.getParameter("semester");
	
	RequestDispatcher dispatcher = null;
	Connection con =null;
	
	 if(uname == null || uname.equals("")) {
		 request.setAttribute("status", "invalidName");
		 dispatcher =request.getRequestDispatcher("registration.jsp");
		 dispatcher.forward(request, response);
	 }
	 if(uemail == null || uemail.equals("")) {
		 request.setAttribute("status", "invalidEmail");
		 dispatcher =request.getRequestDispatcher("registration.jsp");
		 dispatcher.forward(request, response);
	 }
	 if(upwd == null || upwd.equals("")) {
		 request.setAttribute("status", "invalidPwd");
		 dispatcher =request.getRequestDispatcher("registration.jsp");
		 dispatcher.forward(request, response);
	 }else if(!upwd.equals(reupwd)){
		 request.setAttribute("status", "passwordNotMatch");
		 dispatcher =request.getRequestDispatcher("registration.jsp");
		 dispatcher.forward(request, response);
	 }
	 if(umobile == null || umobile.equals("")) {
		 request.setAttribute("status", "invalidMobile");
		 dispatcher =request.getRequestDispatcher("registration.jsp");
		 dispatcher.forward(request, response);
	 } else if(umobile.length()!=10) {
		 request.setAttribute("status", "invalidMobileLength");
		 dispatcher =request.getRequestDispatcher("registration.jsp");
		 dispatcher.forward(request, response);
		 
	 }
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","root");
		PreparedStatement pst=con.prepareStatement("insert into users(uname,upwd,uemail,umobile,department,semester) value(?,?,?,?,?,?)");
		pst.setString(1, uname);
		pst.setString(2, upwd);
		pst.setString(3, uemail);
		pst.setString(4, umobile);
		pst.setString(5, department);
		pst.setString(6, semester);
		int rowCount = pst.executeUpdate();
		
		if(rowCount > 0) {
			request.setAttribute("status", "Success");
			dispatcher = request.getRequestDispatcher("registration.jsp");
		}
		else
		{
			request.setAttribute("status", "Failed");
		}
		dispatcher.forward(request, response);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally {
		try {
			con.close();
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		}
		
	}
	}

}
