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
		echo "<br>"."Error occured!"."<br>";
	}
?>