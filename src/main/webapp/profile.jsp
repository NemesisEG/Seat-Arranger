<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-theme="pastel">
<head>
<meta charset="UTF-8">
<title>Profile</title>
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
      <h2 class="card-title">Profile</h2>
      
      <% 
String userRole = (String) session.getAttribute("role");

if ("student".equals(userRole)) {
%>
   <table class="table" method="post" action="profile">
      
        <!-- head -->
        <thead>
          <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <!-- row 1 -->
          <tr class="hover">
            <td>Name</td>
            <td><%=session.getAttribute("name") %></td>
          </tr>
          <!-- row 2 -->
          <tr class="hover">
            <td>E-mail</td>
            <td><%=session.getAttribute("email") %></td>
          </tr>
          <!-- row 3 -->
          <tr class="hover">
            <td>Mobile</td>
            <td><%=session.getAttribute("mobile") %></td>
          </tr>
          <tr class="hover">
            <td>Course</td>
            <td><%=session.getAttribute("department") %></td>
          </tr>
          <tr class="hover">
            <td>Semester</td>
            <td><%=session.getAttribute("semester") %></td>
          </tr>
          <tr class="hover">
            <td>Role</td>
            <td><%=session.getAttribute("role") %></td>
          </tr>
        </tbody>
      </table>
<%
} else if ("admin".equals(userRole)) {
%>
 <table class="table" method="post" action="profile">
      
        <!-- head -->
        <thead>
          <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <!-- row 1 -->
          <tr class="hover">
            <td>Name</td>
            <td><%=session.getAttribute("name") %></td>
          </tr>
          <!-- row 2 -->
          <tr class="hover">
            <td>E-mail</td>
            <td><%=session.getAttribute("email") %></td>
          </tr>
          <!-- row 3 -->
          <tr class="hover">
            <td>Mobile</td>
            <td><%=session.getAttribute("mobile") %></td>
          </tr>
          <tr class="hover">
            <td>Role</td>
            <td><%=session.getAttribute("role") %></td>
          </tr>
        </tbody>
      </table>
<%
} else if ("superuser".equals(userRole)) {
%>   <table class="table" method="post" action="profile">
      
        <!-- head -->
        <thead>
          <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <!-- row 1 -->
          <tr class="hover">
            <td>Name</td>
            <td><%=session.getAttribute("name") %></td>
          </tr>
          <!-- row 2 -->
          <tr class="hover">
            <td>E-mail</td>
            <td><%=session.getAttribute("email") %></td>
          </tr>
          <!-- row 3 -->
          <tr class="hover">
            <td>Mobile</td>
            <td><%=session.getAttribute("mobile") %></td>
          </tr>
          <tr class="hover">
            <td>Role</td>
            <td><%=session.getAttribute("role") %></td>
          </tr>
        </tbody>
      </table>
<%
} else {
%>
    <!-- Default content for unknown roles or unauthenticated users -->
    <h1>Welcome, Guest!</h1>
    <!-- Display default content or handle unauthorized access here -->
<%
}
%>
      
      <div class="card-actions justify-end">
        <button class="btn btn-primary">Reset Password</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>