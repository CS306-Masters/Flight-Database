<?php
	require("connector.php");
	$newTime = $_POST["newTime"];
	$flightNumber = $_POST["flightNumber"];
	$sql = "CALL flightTimeUpdate('$newTime', '$flightNumber')";
	$mysqli_result = mysqli_query($db, $sql);
	if ($mysqli_result) {
		echo "Update is succesfull!";
	}
	else {
		echo mysqli_error($db);
		echo "Error occured!"."<br>";
	}
?>