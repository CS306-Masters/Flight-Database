<html>
<head>
	<?php
	require("connector.php");
	$customerNumber = $_POST["customerNumber"];
	$flightNumber = $_POST["flightNumber"];
	$sql = "CALL viewFlightInfo('$customerNumber', '$flightNumber')";
	$mysqli_result = mysqli_query($db, $sql);
	$count = $mysqli_result->num_rows;
	if(!$mysqli_result) {
		die('Error while processing the query!');
	}
	?>
  <title>Flight Information</title>
  <!--Import Google Icon Font-->
  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="../../css/materialize.min.css"  media="screen,projection">
  <!--Let browser know website is optimized for mobile-->
  <link type="text/css" rel="stylesheet" href="../../css/main.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="js/materialize.min.js"></script>
  <!-- navbar -->
  <header>
    <nav class="z-depth-2 grey darken-4" id="navbar">
      <div class="nav-wrapper container">
          <span class="container brand-logo white-text" id="navTitle">Airport DBMS | Flight Info</span>
      </div>
    </nav>
  </header>

	<main>
		<div class="container">
			<div class="card-panel">
				<?php
				if ($count == 0) {
					echo "Flight number or the customer number is wrong.";
				}
				else { echo "
				<table class=\"centered\">
					<thead>
						<tr>
							<td>Name</td>
							<td>Customer No</td>
							<td>Flight No</td>
							<td>Timestamp</td>
							<td>Departure</td>
							<td>Destination</td>
						</tr>
					</thead>
					<tbody> " ?>
						<?php
						while($row = mysqli_fetch_assoc($mysqli_result)) {
							$name = $row['name'];
							$cust_no = $row['customer_no'];
							$f_no = $row['flight_number'];
							$time = $row['departure/arrivalTime'];
							$dest = $row['destination'];
							$dep = $row['departure'];
							echo
							"<tr>
								<td>$name</td>
								<td>$cust_no</td>
								<td>$f_no</td>
								<td>$time</td>
								<td>$dep</td>
								<td>$dest</td>
							 </tr>
							";
						}
						echo "</tbody>
									</table>";
					}
						?>
			</div>
			<a class="right waves-effect waves-light btn hoverable" href="pass.html">Go Back</a>
		</div>
	</main>
	<style>
	#flightInfoCard {
		margin-top: 100px;
	}
	</style>
</body>
</html>
