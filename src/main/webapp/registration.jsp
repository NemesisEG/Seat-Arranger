<!DOCTYPE html>
<html lang="en" data-theme="pastel">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
					<div class="signup-image">
						
					</div>
					<h1 class="form-title" style="font-size: 36px">Seat Arranger</h1>
						<h2 class="form-title" style="font-size: 22px">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								 <input
									type="text" name="name" id="name" placeholder="Your Name" required="required"/>
							</div>
							<div class="form-group">
								 <input
									type="email" name="email" id="email" placeholder="Your Email" required="required"/>
							</div>
							<div class="form-group">
								<input
									type="password" name="pass" id="pass" placeholder="Password" required="required"/>
							</div>
							<div class="form-group">
								
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" required="required"/>
							</div>
							<div class="form-group">
								
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" required="required" />
							</div>
	<div class="form-group">
    <label for="department"><i class="zmdi zmdi-chevron-down"></i></label>
    <select name="department" id="department" required="required" onchange="changeSemesters()">
        <option value="" disabled selected>Select Department</option>
        <option value="BTech">B.Tech</option>
        <option value="BCA">BCA</option>
        <option value="BSc">BSc</option>
        <option value="BA LLB">BA LLB</option>
        <option value="LLM">LLM</option>
        <option value="MCA">MCA</option>
    </select>
</div>

<div class="form-group">
    <label for="semester"><i class="zmdi zmdi-chevron-down"></i></label>
    <select name="semester" id="semester" required="required">
        <option value="" disabled selected>Select Semester</option>
    </select>
</div>

							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
							
							<a href="login.jsp" class="signup-image-link">I am already
							member</a>
						</form>
					</div>
					
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
		
	<script type="text/javascript">
	
	function changeSemesters() {
	    var department = document.getElementById("department").value;
	    var total = document.getElementById("semester");
	    total.innerHTML = "";
	    if (department == "B.Tech") {
	        for (var i = 1; i <= 7; i++) {
	            var option = document.createElement("option");
	            option.value = i; 
	            option.text = i;
	            total.add(option);
	        }
	    } else if (department == "BCA") {
	        for (var i = 1; i <= 5; i++) {
	            var option = document.createElement("option");
	            option.value = i;  
	            option.text = i;
	            total.add(option);
	        }
	    }else if (department == "BSc") {
	        for (var i = 1; i <= 5; i++) {
	            var option = document.createElement("option");
	            option.value = i;  
	            option.text = i;
	            total.add(option);
	        }
	    }else if (department == "BA LLB") {
	        for (var i = 1; i <= 9; i++) {
	            var option = document.createElement("option");
	            option.value = i;  
	            option.text = i;
	            total.add(option);
	        }
	    }else if (department == "LLM") {
	        for (var i = 1; i <= 1; i++) {
	            var option = document.createElement("option");
	            option.value = i;  
	            option.text = i;
	            total.add(option);
	        }
	    }else if (department == "MCA") {
	        for (var i = 1; i <= 3; i++) {
	            var option = document.createElement("option");
	            option.value = i;  
	            option.text = i;
	            total.add(option);
	        }
	    } else {
	        total.innerHTML = "Select Department First";
	    }
	}

	
		var status=document.getElementById("status").value;
		if(status=="Success"){
			swal("Congrats","Account Created Successfully,","success");
		}
		else if(status=="invalidName"){
			swal("","Please, enter Username","error");
		}
		else if(status=="invalidEmail"){
			swal("","Please, enter email","error");
		}
		else if(status=="invalidPwd"){ 
			swal("","Please, enter Password","error");
		}
		else if(status=="passwordNotMatch"){
			swal("","Password do not match","error");
		}
		else if(status=="invalidMobile"){
			swal("","Please, enter Mobile Number","error");
		}
		else if(status=="invalidMobileLength"){
			swal("","Please, enter 10 digit Mobile Number","error");
		}
	</script>



</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>