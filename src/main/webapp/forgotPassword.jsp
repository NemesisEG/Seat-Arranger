<!doctype html>
<html data-theme="pastel">
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Forgot Password</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-size: cover;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}
</style>
<link href="https://cdn.jsdelivr.net/npm/daisyui@3.9.4/dist/full.css"
	rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body oncontextmenu='return false' class='snippet-body'>


	<div class="flex justify-center items-center h-screen">
		<div class="card-normal w-96 bg-base-100 shadow-xl">
			<div class="card-body">
				<form action="forgotPassword" method="POST">
					<div>
						<div class="form-group">
							<label for="email-for-pass">Forgot Password</label> <input
								class="form-control" type="text" name="email"
								id="email-for-pass" placeholder="enter your email" required=""><small
								class="form-text text-muted">Enter the registered email
								address . Then we'll email a OTP to this address.</small>
						</div>
						<div>
							<button class="btn-md btn-active btn-primary" type="submit">Get
								New Password</button>

							<button class="btn-md btn-active btn-error" type="submit">Back
								to Login</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	<script type='text/javascript' src=''></script>
	<script type='text/javascript' src=''></script>
	<script type='text/Javascript'></script>
</body>
</html>