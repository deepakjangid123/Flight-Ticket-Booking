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
		<form>
			<label >Name</label>
			<div class="form-inline">
				<div class="form-group">
					<input type="text" class="form-control" id="ifname" placeholder="First Name" reqiured>
				</div>
		  		<div class="form-group">
					<input type="text" class="form-control" id="ilname" placeholder="Last Name" reqiured>
				</div>
			</div>
		
			<div class="form-group">
					<label for="iemail1">Email address</label>
					<input type="email" class="form-control" id="iemail1" placeholder="Email">
			</div>
			<div class="form-group ">
				<label for="ipwd1">Password</label>
				<input type="password" class="form-control" id="ipwd1" placeholder="Password" >
			</div>
			<div class="form-group">
				<label for="ipwd2">Confirm Password</label>
				<input type="password" class="form-control" id="ipwd1" placeholder="Password" >
			</div>
			<div class="form-group">
				<label for="icontact">Contact Number</label>
				<input type="number" class="form-control" maxlength="10" id="icontact" placeholder="10-digit number">
			</div>
			<div class="form-group">
				<label for="idob">Date Of Birth</label>
				<input type="date" max="2001-10-29" min="1960-01-01" class="form-control" id="idob" >
			</div>
			<div class="form-group">
				<label for="icredit">Credit Card Number</label><br>
				<input type="number" class="form-control" maxlength="16" id="icredit" placeholder="16-digit number">
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
