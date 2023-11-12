<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-theme="pastel">
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link href="https://cdn.jsdelivr.net/npm/daisyui@3.9.4/dist/full.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div><div class="navbar bg-base-300">
  <a class="btn btn-ghost normal-case text-xl" href="index.jsp">Seat Arranger</a>
</div>
</div>
<div class="flex justify-center items-center h-screen">
<div class="card w-96 bg-base-100 shadow-xl">
  <div class="card-body items-center text-center">
    <h2 class="card-title">Change Password</h2>
    <form class="form-horizontal" action="changePassword" method="POST">
								<!-- User Name Input -->
<div >
	<input type="text" name="oldPassword" placeholder=" Old Password"
		class="input input-bordered input-secondary w-full max-w-xs ">
</div>
<br>
<div >
	<input type="text" name="password" placeholder=" New Password"
		class="input input-bordered input-secondary w-full max-w-xs ">
</div>							
<br>
<div >
	<input type="password" name="confPassword" placeholder="Confirm New Password"
		class="input input-bordered input-secondary w-full max-w-xs">
</div>
<br>
								
   <div>
      <input type="submit" value="Reset" class="btn btn-primary btn-active ">
    </div>
    </form>

 
  </div>
</div>
</div>
</body>
</html>