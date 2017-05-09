<?php
	require("connector.php");
	
	$customerNumber = $_POST["customerNumber"];
	$flightNumber = $_POST["flightNumber"];

	$sql = "CALL viewFlightInfo($customerNumber, $flightNumber)";

	$mysqli_result = mysqli_query($db, $sql);

	$count = $mysqli_result->num_rows;
	
	if ($mysqli_result) {
		if ($count == 0) {
			echo "Flight number or the customer number is wrong.";
		}
		else {
			while($row = mysqli_fetch_assoc($mysqli_result)) {
				echo $row['name']." ".$row['customer_no']." ".$row['flight_number']." ".$row['departure/arrivalTime'].$row['	destination'].$row['departure']."<br>";
			}
		}
	}
	else {
		echo mysqli_error($db);
		echo "Error occured!"."<br>";
	}
?>