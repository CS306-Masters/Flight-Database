<?php
	require("connector.php");
	
	$flightNumber = $_POST["flightNumber"];
	$planeModel = $_POST["planeModel"];
	$tailNumber = $_POST["tailNumber"];
	$gate_park = $_POST["gate_park"];
	$departure_arrivalTime = $_POST["departure_arrivalTime"];
	$is_domestic = $_POST["is_domestic"];
	$flightDestination = $_POST["flightDestination"];
	$flightDeparture = $_POST["flightDeparture"];
	$flightRunway = $_POST["flightRunway"];
	$airlineCode = $_POST["airlineCode"];


	$sql = "CALL addNewFlight($flightNumber, $planeModel, $tailNumber, $gate_park, $departure_arrivalTime, $is_domestic, $flightDestination, $flightDeparture, $flightRunway, $airlineCode)";
	
	$mysqli_result = mysqli_query($db, $sql);

	if ($mysqli_result) {
		echo "Flight $flightNumber added to the flights succesfully!";
	}
	else {
		echo mysqli_error($db);
		echo "Error occured!"."<br>";
	}
?>