<html>
<head>
  <?php
  require ('connector.php');
  $sql = "CALL countRunway();";
  $result = mysqli_query($db, $sql);
  if (!$result) echo "Hata var.";
  ?>
  <title>Count Runway</title>
  <!--Import Google Icon Font-->
  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="../../css/materialize.min.css"  media="screen,projection">
  <!--Let browser know website is optimized for mobile-->
  <link type="text/css" rel="stylesheet" href="../../css/main.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="../../js/materialize.min.js"></script>
  <!-- navbar -->
  <main>
    <div class="container" style="margin-top: 50px">
      <table>
          <thead>
          <tr>
              <th>Runway Number</th>
              <th>Number of Flights</th>
          </tr>
          </thead>
          <tbody>
      		<?php
      while($row = mysqli_fetch_assoc($result)) {
          $runway = $row['runway'];
          $count = $row['COUNT(*)'];

          echo "<tr>
                <td>$runway</td>
                <td>$count</td>
                </tr>";
      }
      ?>

      </tbody>
      </table>
      <div style="margin-top: 70px">
        <a class="right waves-effect waves-light btn hoverable" href="./flight.html">Back<i class="material-icons right">replay</i></a>
      </div>
    </div>
  </main>
</body>
</head>
</html>
