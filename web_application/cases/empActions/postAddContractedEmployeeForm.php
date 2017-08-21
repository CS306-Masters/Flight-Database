<?php
$db = mysqli_connect('localhost', 'root', '', 'flight_cs306');

$ssn = $_POST['ssn'];
$name = $_POST['name'];
$airline_code = $_POST['airline_code'];
$sdate = $_POST['sdate'];
$service_type = $_POST['service_type'];
$contract_id = $_POST['contract_id'];

$command = "CALL addContractedEmployee('$sdate', '$airline_code', $ssn, '$name', '$service_type', $contract_id)";
$result = mysqli_query($db, $command);

if ($result) {
    echo "Employee is added to the database successfully";
}
else {
    echo mysqli_error($db);
}
?>

<!-- <meta http-equiv="refresh" content="5; url=emp.php" /> -->
