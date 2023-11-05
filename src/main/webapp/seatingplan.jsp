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
String course = (String) session.getAttribute("department");
int sem = (int) session.getAttribute("semester");


%>

<div class="overflow-x-auto">
  <table class="table table-zebra">
    <!-- head -->
    <thead>
      <tr>
        <th></th>
        <th>Name</th>
        <th>Venue</th>
        
      </tr>
    </thead>
    <tbody>
      <% 
        String BCA[][]={{"Foundations of Entrepreneurship","Digital Design and Computer Organization","Computational Thinking with Python","Web Technologies, New Age Life Skills","Mathematics Foundations"},
                        {"Microprocessors and Computer Architecture","C Programming","Data Structures : Concepts and Practice","Information Management System: Structure and Development","Mathematics for Computer Applications","System and Software Development Life Cycle"},
                        {"Network Essentials","Cloud Computing Foundations","Object Oriented Programming using Java ","Operating System Concepts","Design and Analysis of Algorithms","Economics and Business Perspective of IT Projects","Ethics for Professionals, Patents, Copyrights and IPR"},
                        {"Mobile Programming","Solving Problems with Design Thinking and Innovation","Competitive Programming Skills"}};
      
      String BTECH[][]={{"Computational Thinking and Programming","Engineering Calculus","Electromagnetics","Environment and Sustainability","Foundations of Innovation and Entrepreneurship","New Age Life Skills"},
    		  {"Object Oriented Programming using Java","Digital Design","Discrete Mathematical Structures","Linear Algebra and Ordinary Differential Equations","Mechanics","Introduction to Electrical and Electronics Engineering"},
    		  {"Information Management Systems","Data Structures using C++","Microprocessors and Computer Architecture","Probability and Statistics","Software Engineering"},
    		  {},{},{},{}};

        if ("student".equals(userRole)) {
        	if("BCA".equals(course)){
          for (int j = sem-1; j==sem-1 ; j++) {
            for (int i = 0; i < BCA[j].length; i++) {
      %>
      <!-- row -->
      <tr>
        <th><%= i + 1 %></th>
        <td><%= BCA[j][i] %></td>
        <td>coming soon</td>
      </tr>
      <%
            }
          }
        }else if("BTECH".equals(course)){
            for (int j = sem-1; j==sem-1 ; j++) {
                for (int i = 0; i < BTECH[j].length; i++) {
          %>
          <!-- row -->
          <tr>
            <th><%= i + 1 %></th>
            <td><%= BTECH[j][i] %></td>
            <td>coming soon</td>
          </tr>
          <%
                }
              }
            }
        	}
        else if ("admin".equals(userRole)) {
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
  
    </tbody>
  </table>
</div>





      
    </div>
  </div>
</div>
</body>
</html>