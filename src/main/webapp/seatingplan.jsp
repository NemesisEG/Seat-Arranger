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
int seatCounter = 1;
int noOfClassrooms = 10;


%>

<div class="overflow-x-auto">
  <table class="table table-zebra">
    <!-- head -->
    <thead>
      <tr>
        <th></th>
        <th>Name</th>
        <th>Seat</th>
        
      </tr>
    </thead>
    <tbody>
      <% 
      String BCA[][] = {
    		    {"Foundations of Entrepreneurship", "Digital Design and Computer Organization", "Computational Thinking with Python", "Web Technologies", "New Age Life Skills", "Mathematics Foundations"},
    		    {"Microprocessors and Computer Architecture", "C Programming", "Data Structures : Concepts and Practice", "Information Management System: Structure and Development", "Mathematics for Computer Applications", "System and Software Development Life Cycle"},
    		    {"Ethics for Professionals, Patents, Copyrights and IPR", "Object Oriented Programming using Java", "Cloud Computing Foundations", "Operating System Concept", "Design and Analysis of Algorithms", "Economics and Business Perspective of IT Projects"},
    		    {"Mobile Programming", "Seminar on Special Topics in Computer Applications", "Solving Problems with Design Thinking and Innovation", "Competitive Programming Skills", "Open Elecive-1", "Specialization Elective-1", "Specialization Elective-2"},
    		    {"Artificial Intelligence and Machine Learning", "Specialization Elective-3", "Specialization Elective-4", "Business Intelligence and Data Analytics", "Environment and Sustainability", "Full Stack Development", "Open Elective-2", "Network Security"}
    		};
      
      String BTech[][] = {
    		    {"Computational Thinking and Programming","Engineering Calculus","Electromagnetics","Environment and Sustainability","Foundations of Innovation and Entrepreneurship","New Age Life Skills"},
    		    {"Object Oriented Programming using Java","Digital Design","Discrete Mathematical Structures","Linear Algebra and Ordinary Differential Equations","Mechanics","Introduction to Electrical and Electronics Engineering"},
    		    {"Information Management Systems","Data Structures using C++","Microprocessors and Computer Architecture","Probability and Statistics","Software Engineering","Specialization Core - I"},
    		    {"Design and Analysis of Algorithms","Computer Networks","Ethics for Engineers, Patents, Copyrights and IPR","Operating Systems","Design Thinking & Innovation","Specialization Core - II","Open Elective - I"},
    		    {"Artificial Intelligence and Machine Learning","Automata Theory and Computability","High Performance Computing","Seminar on Special Topics in Emerging Areas","Competitive Programming","Specialization Elective - I"},
    		    {"Undergraduate Research in Computer Science Engineering","HSS - Elective","Specialization Elective - III","Elective - IV","Open Elective - II","Elective - V","Open Elective-III"},
    		    {"Capstone Project","Specialization Elective - VI","Open Elective - IV"}
    		};

      	
      	String BSC[][] = {
      		    {"Introduction to Innovation and Entrepreneurship", "Digital Design and Logic", "Python for Problem solving and Analytical Reasoning", "Ethics, Patents, Copyrights and IPR", "Critical Thinking and Communication Skills", "Mathematics Foundations for Computer Science", "Environment, Ecology and Energy"},
      		    {"Basics of Microprocessors and Computer Architecture", "Practical Approach to programming with C", "Problem Solving Using Data Structures", "Integral and Differential Calculus", "Discrete Mathematics", "Software System and Development Methods"},
      		    {"Java Programming using OOPS", "Fundamentals of Operating System", "Algorithm Analysis and Design", "Statistics and Probability"},
      		    {"Design Thinking and Innovation", "Network Essentials", "Competitive Programming", "Database Management System", "Seminar on Special Topics in Computer Science"},
      		    {"Capstone Project"}
      		};
      	
      	String BBA[][] = {
      		    {"Business Communication I", "Business Intelligence Tools", "Business Economics", "Business Mathematics", "Business Accounting", "Business Management"},
      		    {"Financial Management", "Organizational Behavior", "Production & Operations Management", "Marketing Management", "Business Communication II (Report Writing)", "Critical Thinking"},
      		    {"Human Resources Management", "Corporate Governance", "Business Research Methods - I"},
      		    {"Business Ethics", "Business Law", "Business Research Methods - II"},
      		    {"Strategic Management", "Design Thinking & Innovation", "Entrepreneurship & Startups"},
      		    {"Environmental Studies", "Game Theory"}
      		};
      	
      	String BAJmc[][] = {
      		    {"News Writing", "Editing and Page Making", "Digital Photography", "Basics of Advertising", "Business of Print", "News Analysis I", "How India Works (Indian Polity)", "Foundations of Entrepreneurship"},
      		    {"Social Media", "Mobile Media", "Web Journalism", "Advertising Strategy", "News Analysis II", "How India Works (Environment Studies)"},
      		    {"Radio, Music and Streaming", "Television Journalism", "Business, Law and Structure of Television", "Public Relations & Corporate Communication", "Media Planning and Buying", "News Analysis III", "How India Works (Society)"},
      		    {"Business of Film Making", "Film Studies and Digital Film Making", "Media Ethics", "Digital Marketing & Native Advertising", "Event Management", "Theories of Mass Communication", "News Analysis IV", "How India Works (Economy)"},
      		    {"Brand Management", "Media Law and Government", "Data Journalism", "Social Media Marketing", "Multimedia", "News Analysis V", "How India Works (Human Rights and Media)"}
      		};
      	
      	String BBALLB[][] = {
      		    {"Legal Methods", "Law of Torts", "English I", "Theory and Practice of Management", "Economics I", "Marketing Management"},
      		    {"Law of Contracts I", "English II", "Human Resource Management", "Economics II", "Legal and Constitutional History", "Clinic 1 - Moot Court"},
      		    {"Law of Contracts II", "Law of Crimes I", "Constitutional Law I", "Jurisprudence", "Strategic Management", "Business Accounting"},
      		    {"Constitutional Law II", "Family Law I", "Interpretation of Statutes", "Law of Crimes II", "Financial Management"},
      		    {"Family Law II", "Property Law", "Company Law", "Civil Procedure Code & Law of Limitation", "Criminal Procedure Code"},
      		    {"Law of Evidence", "Corporate Finance", "Clinic 2-ADR (Special Emphasis on Mediation)", "Criminology, Penology and Victimology", "Administrative Law", "Banking Law"},
      		    {"Labour & Industrial Law I", "Intellectual Property Law", "Public International Law", "Insurance Law", "Honours Paper I", "Honours Paper II (Interdisciplinary)"},
      		    {"Labour & Industrial Law II", "Principle of Taxation", "Clinic III - Drafting, Pleading and Conveyance", "Honours Paper III"},
      		    {"Environmental Law", "Human Rights Law", "Clinic IV - Professional Ethics", "Honours Paper V", "Honours Paper VI"},
      		    {"Honours Paper VII", "Honours Paper VIII", "Honours Paper IX", "Honours Paper X (Interdisciplinary)", "Honours Paper XI (Research Project)"}
      		};
      	
      	String MTech[][] = {
      		    {"Advanced Data Structures using Python", "Computability, Complexity and Algorithms", "Specialization Core-I", "Soft Skills for Professionals", "Specialization Elective - I", "Specialization Project", "Innovation and Entrepreneurship"},
      		    {"Advanced Operating System", "Software Design and Architecture", "Advanced Information Management Systems", "Advanced Networks", "Specialization Core-II", "Specialization Elective-II", "Industry Research Project", "Ethics, Patents, Copyrights, and IPR"},
      		    {"Capstone Project"}
      		};
      	
      	String MBA[][] = {
      		    {"Organizational Behavior and Organizational Development", "Operations Management", "Financial Accounting and Financial Statement Analysis", "Managerial Communication", "Managerial Economics", "Business Intelligence Tools", "Quantitative Methods for Business"},
      		    {"Marketing Management", "Financial Management", "Business Research Methods", "Business Ethics & Corporate Governance", "Human Resources Management", "Business Law", "International Business"},
      		    {"Entrepreneurship and Managing Startups", "Strategic Management"},
      		    {"Design Thinking and Innovation", "Managerial Decisions and Critical Thinking"}
      		};
      	
      	String MCA[][] = {
      		    {"Data Structures using Python Programming", "Algorithms Design for Computer Applications", "Life Skills", "Foundation of Entrepreneurship"},
      		    {"Operating System Essentials", "Software Development Framework", "Information and Database Management Systems", "Computer Network-Layers and Protocols", "Product Design Technology", "Professionals Ethics, Patent, Copyrights and IPR"},
      		    {"Capstone Project"}
      		};
      	
      	//TESTING DATA FOR THE PROJECT 
      	
      	
		String Seats[] = {"SeatNo.1","SeatNo.2","SeatNo.3","SeatNo.4","SeatNo.5","SeatNo.6","SeatNo.7","SeatNo.8","SeatNo.9"};
		
		/* String ClassroomID []= {"Classroom1","Classroom2","Classroom3","Classroom4","Classroom5","Classroom6","Classroom7","Classroom8","Classroom9","Classroom10"};
		
		int ClassroomSize [] = {30,50,40,60,70,25,15,45,35,20};
		
		String RandomNames [] = {"Ethan","Samrat","Nishant","Saumya","Maaz","Arshi","Ansh","Manvi","Kanika","Lakshay"}; */
		
		// THE ABOVE CODE WILL BE REMOVED WHEN CONNECTED TO BACKEND
		
        if ("student".equals(userRole)) {
        	if("BCA".equals(course)){
          for (int j = sem-1; j==sem-1 ; j++) {
            for (int i = 0; i < BCA[j].length && i < Seats.length; i++) {
            	String seatNumber = Seats[i];
      %>
      <!-- row -->
      <tr>
        <th><%= i + 1 %></th>
        <td><%= BCA[j][i] %></td>
        <td><%= seatNumber %></td>
      </tr>
      <%
            }
          }
        }else if("BTech".equals(course)){
            for (int j = sem-1; j==sem-1 ; j++) {
                for (int i = 0; i < BTech[j].length; i++) {
          %>
          <!-- row -->
          <tr>
            <th><%= i + 1 %></th>
            <td><%= BTech[j][i] %></td>
            <td>coming soon</td>
          </tr>
          <%
                }
              }
            }else if("BSC".equals(course)){
                for (int j = sem-1; j==sem-1 ; j++) {
                    for (int i = 0; i < BSC[j].length; i++) {
              %>
              <!-- row -->
              <tr>
                <th><%= i + 1 %></th>
                <td><%= BSC[j][i] %></td>
                <td>coming soon</td>
              </tr>
              <%
                    }
                  }
                }else if("BBA".equals(course)){
                    for (int j = sem-1; j==sem-1 ; j++) {
                        for (int i = 0; i < BBA[j].length; i++) {
                  %>
                  <!-- row -->
                  <tr>
                    <th><%= i + 1 %></th>
                    <td><%= BBA[j][i] %></td>
                    <td>coming soon</td>
                  </tr>
                  <%
                        }
                      }
                    }else if("BAJmc".equals(course)){
                        for (int j = sem-1; j==sem-1 ; j++) {
                            for (int i = 0; i < BAJmc[j].length; i++) {
                      %>
                      <!-- row -->
                      <tr>
                        <th><%= i + 1 %></th>
                        <td><%= BAJmc[j][i] %></td>
                        <td>coming soon</td>
                      </tr>
                      <%
                            }
                          }
                        }else if("BBALLB".equals(course)){
                            for (int j = sem-1; j==sem-1 ; j++) {
                                for (int i = 0; i < BBALLB[j].length; i++) {
                          %>
                          <!-- row -->
                          <tr>
                            <th><%= i + 1 %></th>
                            <td><%= BBALLB[j][i] %></td>
                            <td>coming soon</td>
                          </tr>
                          <%
                                }
                              }
                            }else if("MTech".equals(course)){
                                for (int j = sem-1; j==sem-1 ; j++) {
                                    for (int i = 0; i < MTech[j].length; i++) {
                              %>
                              <!-- row -->
                              <tr>
                                <th><%= i + 1 %></th>
                                <td><%= MTech[j][i] %></td>
                                <td>coming soon</td>
                              </tr>
                              <%
                                    }
                                  }
                                }else if("MBA".equals(course)){
                                    for (int j = sem-1; j==sem-1 ; j++) {
                                        for (int i = 0; i < MBA[j].length; i++) {
                                  %>
                                  <!-- row -->
                                  <tr>
                                    <th><%= i + 1 %></th>
                                    <td><%= MBA[j][i] %></td>
                                    <td>coming soon</td>
                                  </tr>
                                  <%
                                        }
                                      }
                                    }else if("MCA".equals(course)){
                                        for (int j = sem-1; j==sem-1 ; j++) {
                                            for (int i = 0; i < MCA[j].length; i++) {
                                      %>
                                      <!-- row -->
                                      <tr>
                                        <th><%= i + 1 %></th>
                                        <td><%= MCA[j][i] %></td>
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
        	    
        	    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classroom Seating</title>
    <style>
        .scrollable-container {
            max-height: 600px; /* Adjust the max height as needed */
            overflow-y: auto;
        }

        table {
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        .classroom-section {
            display: inline-block;
            margin-right: 20px;
            vertical-align: top;
        }
    </style>
</head>
<body>

    <h2>Classroom Seating Plan</h2>

    <div class="scrollable-container">
        <% 
            String ClassroomID[] = {"Classroom1", "Classroom2", "Classroom3", "Classroom4", "Classroom5", "Classroom6", "Classroom7", "Classroom8", "Classroom9", "Classroom10"};
            int ClassroomSize[] = {30, 50, 40, 40, 40, 25, 15, 45, 35, 20};
            String RandomNames[] = {"Ethan", "Samrat", "Nishant", "Saumya", "Maaz", "Arshi", "Ansh", "Manvi", "Kanika", "Lakshay", "Ethan", "Samrat", "Nishant", "Saumya", "Maaz", "Arshi", "Ansh", "Manvi", "Kanika", "Lakshay", "Ethan", "Samrat", "Nishant", "Saumya", "Maaz", "Arshi", "Ansh", "Manvi", "Kanika", "Lakshay", "Ethan", "Samrat", "Nishant", "Saumya", "Maaz", "Arshi", "Ansh", "Manvi", "Kanika", "Lakshay"};

            int studentIndex = 0;

            for (int i = 0; i < ClassroomID.length; i++) {
        %>
        <div class="classroom-section">
            <h3><%= ClassroomID[i] %></h3>
            <table>
                <tr>
                    <th>Seat Number</th>
                    <th>Name</th>
                </tr>
                <tr>
            <% 
                    for (int j = 0; j < ClassroomSize[i]; j++) {
                        int currentIndex = studentIndex % RandomNames.length;
            %>
                    <td><%= j + 1 %></td>
                    <td><%= RandomNames[currentIndex] %></td>
            <% 
                        studentIndex++;
                    }
            %>
                </tr>
            </table>
        </div>
        <%
            }
        %>
    </div>

</body>
</html>
        	    
        	    
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