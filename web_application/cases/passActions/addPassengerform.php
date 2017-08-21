<html>
<head>
	<?php
	require('connector.php');
	$class = $_POST['class'];
	$name = $_POST['name'];
	$customer_no = $_POST['customer_no'];
	$age = $_POST['age'];
	$isFemale = $_POST['sex'];
	$flightNumber = $_POST['flight_number'];
	if ($isFemale == "male") $sql = "CALL addPassenger('$class', '$name', '$customer_no', '$age', '0', '$flightNumber' );";
	else $sql = "CALL addPassenger('$class', '$name', '$customer_no', '$age', '1', '$flightNumber' );";
	$result = mysqli_query($db, $sql);
	if (!$result) echo "hata";

	if($result) {
	    echo "The passenger is added successfully";
	}
	else {
	    echo mysqli_error($db);
	}
	?>
</head>
<body>
	<a href="pass.html">Index</a>
</body>
</html>
