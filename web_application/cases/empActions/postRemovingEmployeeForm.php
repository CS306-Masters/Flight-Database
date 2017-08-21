<?php
$db = mysqli_connect('localhost', 'root', '', 'flight_cs306');

$ssn = $_POST['ssn'];

$command = "CALL removingEmployee($ssn)";
$result = mysqli_query($db, $command);

if ($result) {
    echo "Employee is removed from the databese successfully";
}
else {
    echo mysqli_error($db);
}
?>

<meta http-equiv="refresh" content="2; url=emp.html" />
