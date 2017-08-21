<meta http-equiv="refresh" content="2; url=flight.html" />
<?php
$db = mysqli_connect('localhost', 'root', '', 'flight_cs306');

$ssn = $_POST['ssn'];
$flight_id = $_POST['flight_id'];

$command = "CALL cancelFlightByAdmin($ssn, '$flight_id')";
$result = mysqli_query($db, $command);

$isCanceled = mysqli_query($db, "SELECT is_canceled FROM flights WHERE '$flight_id' = flight_number");

if ($result) {
	$row = mysqli_fetch_assoc($isCanceled);
    $is_canceled = $row['is_canceled'];

	if($is_canceled == 1) {
		echo "Flight is canceled successfully";
	}
	else
		echo "You have no permission to cancel a flight";
}
else {
    echo mysqli_error($db);
}
?>
