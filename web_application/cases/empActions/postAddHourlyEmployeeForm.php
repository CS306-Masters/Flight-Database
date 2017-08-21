<?php
$db = mysqli_connect('localhost', 'root', '', 'flight_cs306');

$ssn = $_POST['ssn'];
$name = $_POST['name'];
$airline_code = $_POST['airline_code'];
$sdate = $_POST['sdate'];
$service_type = $_POST['service_type'];
$hourly_wages = $_POST['hourly_wages'];
$hours_worked = $_POST['hours_worked'];

$command = "CALL addHourlyEmployee('$sdate', '$airline_code', $ssn, '$name', '$service_type', $hourly_wages, $hours_worked)";
$result = mysqli_query($db, $command);

if ($result) {
    echo "Employee is added to the database successfully";
}
else {
    echo mysqli_error($db);
}
?>

<meta http-equiv="refresh" content="2; url=emp.html" />
