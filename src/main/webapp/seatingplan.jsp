<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-theme="pastel">
<head>
<meta charset="UTF-8">
<title>Seating Plan</title>
<link href="https://cdn.jsdelivr.net/npm/daisyui@3.9.4/dist/full.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div><div class="navbar bg-base-300">
  <a class="btn btn-ghost normal-case text-xl" href="index.jsp">Seat Arranger</a>
</div></div>
<div class="flex justify-center items-center h-screen">
  <div class="card-normal w-96 bg-base-100 shadow-xl">
    <div class="card-body">
      <h2 class="card-title">Seating Plan</h2>


<% 
String userRole = (String) session.getAttribute("role");

if ("student".equals(userRole)) {
%>
    <!-- Content for students -->
    <h1>Welcome, Student!</h1>
    <h2><%=session.getAttribute("email") %></h2>
    <!-- Display student-specific data here -->
<%
} else if ("admin".equals(userRole)) {
%>
    <!-- Content for admins -->
    <h1>Welcome, Admin!</h1>
    <h2><%=session.getAttribute("email") %></h2>
    <!-- Display admin-specific data here -->
<%
} else if ("superuser".equals(userRole)) {
%>    <!-- Content for superadmins -->
    <h1>Welcome, Superuser!</h1>
    <h2><%=session.getAttribute("email") %></h2>
    <!-- Display superadmin-specific data here -->
<%
} else {
%>
    <!-- Default content for unknown roles or unauthenticated users -->
    <h1>Welcome, Guest!</h1>
    <!-- Display default content or handle unauthorized access here -->
<%
}
%>


      
    </div>
  </div>
</div>
</body>
</html>