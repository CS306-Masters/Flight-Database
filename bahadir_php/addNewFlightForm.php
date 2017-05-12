<!DOCTYPE html>
<html>
<body>
<form method="post" action="addNewFlight.php">
	Flight Number: <input type="text" name="flightNumber"><br>
	Plane Model: <input type="text" name="planeModel"><br>
	Tail Number: <input type="text" name="tailNumber"><br>
	Parking Gate: <input type="text" name="gate_park"><br>
	Departure or Arrival Time: <input type="text" name="departure_arrivalTime"><br>
	Is flight domestic?: <br><input type="radio" name="is_domestic" value=1 checked> true<br>
	<input type="radio" name="is_domestic" value=0 > false<br>
	Flight Destination: <input type="text" name="flightDestination"><br>
	Flight Departure: <input type="text" name="flightDeparture"><br>
	Flight Runway: <input type="text" name="flightRunway"><br>
	Airline Code: <input type="text" name="airlineCode"><br>
	<input type="submit" value="Add Flight">
</body>
</html>