<!DOCTYPE html>
<html>
<head>
	<title>Flight Information</title>
<?php
	require("connector.php");
	$customerNumber = $_POST["customerNumber"];
	$flightNumber = $_POST["flightNumber"];
	$sql = "CALL viewFlightInfo('$customerNumber', '$flightNumber')";
	$mysqli_result = mysqli_query($db, $sql);
?>

</head>
<body>

<style>
table, th, td {
	border: 1px solid black;
}
</style>
<table>
<thead>
<tr>
	<td>Name</td>
	<td>Customer No</td>
	<td>Flight No</td>
	<td>Departure Time</td>
	<td>Destination</td>
	<td>Departure</td>
</tr>
</thead>
<tbody>
<?php
	$count = $mysqli_result->num_rows;
	if ($mysqli_result) {
		if ($count == 0) {
			echo "Flight number or the customer number is wrong.";
		}
		else {
			while ($row = mysqli_fetch_assoc($mysqli_result)) {
				$name = $row["name"];
				$cusNo = $row["customer_no"];
				$fnum = $row["flight_number"];
				$depArrTime = $row["departure/arrivalTime"];
				$dest = $row["destination"];
				$dep = $row["departure"];
				echo "
					 <tr>
					 <td>$name</td>
					 <td>$cusNo</td>
					 <td>$fnum</td>
					 <td>$depArrTime</td>
					 <td>$dep</td>
					 <td>$dest</td>
					 </tr>";
				}
		}
	}
	else {
		echo mysqli_error($db);
		echo "<br>"."Error occured!"."<br>";
	}
?>
</tbody>
</table>
</body>
</html>