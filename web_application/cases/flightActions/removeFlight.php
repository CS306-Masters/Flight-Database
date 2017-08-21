<html>
<head>
	<title>Remove Flight</title>
	<meta http-equiv="refresh" content="2; url=flight.html" />
</head>
<body>
	<?php
		require("connector.php");

		$customerNumber = $_POST["customerNumber"];
		$flightNumber = $_POST["flightNumber"];

		$sql = "CALL removeFlight('$customerNumber', '$flightNumber')";

		$mysqli_result = mysqli_query($db, $sql);

		if ($mysqli_result) {
			echo "Passenger's Flight $flightNumber removed succesfully!";
		}
		else {
			echo mysqli_error($db);
			echo "Error occured!"."<br>";
		}
	?>
</body>
</html>
