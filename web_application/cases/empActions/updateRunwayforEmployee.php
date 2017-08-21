<?php

require('connector.php');

$assign_runway = $_POST['assign_runway'];
$employee_ssn = $_POST['employee_ssn'];

$sql = "CALL updateRunwayforEmployee('$assign_runway', '$employee_ssn');";
$result = mysqli_query($db, $sql);

if($result) {
    echo "The employe xxx is assigned to runway xxx";
}
else {
    echo mysqli_error($db);
}
?>

<a href="index.html">Index</a>
