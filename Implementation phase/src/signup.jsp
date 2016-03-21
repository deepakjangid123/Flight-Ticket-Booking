<!DOCTYPE html>
<html>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<!-- Optional theme -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="./bootstrap/js/bootstrap.min.js"></script>
<title>Sign up</title>
<body background="images\hp_bg.jpg">
<a align="center" href="homepage.htm" target="link" style="color:lime"><h1>GreenTrip.com</h1></a>
<div class="container col-md-4 col-md-offset-5">
	<!-- TiTle -->
	<div class="row">
		<h3 class="text-center">Fill this information</h3>
	</div>
	<!--Sign UpFrom-->
	<div class="row">
		<form action="signupverify.jsp">
			<label >Name</label>
			<div class="form-inline">
				<div class="form-group">
					<input type="text" name="firstname" class="form-control" id="ifname" placeholder="First Name" required>
				</div>
		  		<div class="form-group">
					<input type="text" name="lastname" class="form-control" id="ilname" placeholder="Last Name">
				</div>
			</div>
			<div class="form-group">
					<label for="Address">Address</label>
					<input type="text" name="Address" class="form-control" id="iaddress1" placeholder="Address">
			</div>
			<div class="form-group">
					<label for="gender">Gender</label>
					<input type="text" maxlength="1" name="gender" class="form-control" id="igender1" placeholder="M/F" required>
			</div>
			<div class="form-group">
					<label for="Email">Email address</label>
					<input type="email" name="Email" class="form-control" id="iemail1" placeholder="Email" required>
			</div>
			<div class="form-group ">
				<label for="PWD1">Password</label>
				<input type="password" name="PWD1" class="form-control" id="ipwd1" placeholder="Password" required>
			</div>
			<div class="form-group">
				<label for="PWD2">Confirm Password</label>
				<input type="password" name="PWD2" class="form-control" id="ipwd1" placeholder="Password" required>
			</div>
			<div class="form-group">
				<label for="Contact">Contact Number</label>
				<input type="number" name="Contact" class="form-control" maxlength="10" id="icontact" placeholder="10-digit number" required>
			</div>
			<div class="form-group">
				<label for="DOB">Date Of Birth</label>
				<input type="date" max="2001-10-29" min="1960-01-01" name="DOB" class="form-control" id="idob" required>
			</div>
			<div class="form-group">
				<label for="credit_card_no">Credit Card Number</label><br>
				<input type="number"  max="99999999" min="11111111" name="credit_card_no" class="form-control" id="icredit" placeholder="8-digit number" required>
			</div>
			
			<div class="checkbox">
				<label>
				<input type="checkbox"> Check me out
				</label>
			</div>
		<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
</div>

</body>
</html>
