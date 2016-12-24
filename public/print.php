<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>HTML & CSS Avery Labels (5160) by MM at Boulder Information Services</title>
    <link href="labels.css" rel="stylesheet" type="text/css" >

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <style type="text/css">
        
    .borderClass {
        border: solid #000 1px;
        border-radius: 10px;
        margin: 1em;

    }

    </style>

</head>
<body>


<?php 
//Host: vidhiinfoso.com
$user =  "vidhii98_root";
$password = "Iv08-bQADa#2";
$dbname = "vidhii98_constituency_project_chandnichowk";
//table name : voter_information

  $conn = mysql_connect("localhost",$username,$password);
   mysql_select_db($dbname) or die( "Unable to select database");

   $result = mysql_query("SELECT * from voter_information limit 30 ");

   while($row = mysqli_fetch_assoc($result)) {
        print_r($row); exit;
    }


?>

<div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-xs-4 ">
            <div class="col-md-12 borderClass">
              <h4>Sh. Jai</h4>
              <p>HNO 9 990 M2K Appartsments <br> Plot No 9 Dwarka Delhi <br> New Delhi  </p>
              <p>Pin : 11009 </p>
              
            </div>
        </div>

         <?php 

          foreach ($data as $key =>$val) {
            var_dump($key); exit;
            ?>
              <div class="col-xs-4 ">
            <div class="col-md-12 borderClass">
              <h4><?php echo $val ?></h4>
              <p><?php echo $val ?> </p>
              <p><?php echo $val ?></p>
              <p>Pin : <?php echo $val ?></p>
              
            </div>
        </div>

            <?php 
          }
         ?>


      </div>
        
</div>


</body>
</html>