<html>
<head>
  <title>List Passengers by Flight</title>
  <!--Import Google Icon Font-->
  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="../../css/materialize.min.css"  media="screen,projection">
  <!--Let browser know website is optimized for mobile-->
  <link type="text/css" rel="stylesheet" href="../../css/main.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<?php

	require ('connector.php');

	$fid = $_POST['fid'];
	$sql = "CALL listPassByFlight('$fid');";
	$result = mysqli_query($db, $sql);
	if (!$result) echo "Hata var.";
	?>
</head>
<body>
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="../../js/materialize.min.js"></script>

	<div class="container" style="margin-top: 70px">
		<table>
		    <thead>
		    <tr>
		        <th>Passengers on Flight <?php echo "$fid" ?></th>
				</tr>
				<tr>
						<td>Cust No</td>
						<td>Flight No</td>
						<td>Class</td>
						<td>Name</td>
						<td>Age</td>
						<td>Gender</td>
		    </tr>
		    </thead>
		    <tbody>
				<?php
				while($row = mysqli_fetch_assoc($result)) {
					$customer_no = $row['customer_no'];
					$flight_number = $row['flight_number'];
					$class = $row['class'];
					$name = $row['name'];
					$age = $row['age'];
					$isFemale = $row['isFemale'];

		    echo "<tr>
		          <td>$customer_no</td>
				  <td>$flight_number</td>
				  <td>$class</td>
				  <td>$name</td>
				  <td>$age</td>";
					if ($isFemale) {
						echo "<td>Female</td>";
					}
					else {
						echo "<td>Male</td>";
					}
		}
		?>
		</tbody>
		</table>
		<div style="margin-top: 70px">
			<a class="right waves-effect waves-light btn hoverable" href="./flight.html">Back<i class="material-icons right">replay</i></a>
		</div>
	</div>

</body>
</head>
</html>
