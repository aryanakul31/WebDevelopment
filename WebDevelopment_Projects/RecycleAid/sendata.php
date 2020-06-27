
<html>
<head>
	<title>RECYCLE</title>
	<link rel="stylesheet" href="style1.css">
</head>
<body>

	<header>	<table border="0" align="center">
			<tr>
			
			<td><img class="h" src="3r.jpg" height="120" width="120"></td>
			<td><h1>RECYCLE<em class="t">AID</em></h1>
			
			
			<br><h2>TOGETHER WE CAN MAKE A DIFFERENCE</h2></td>
			</tr>
			</table>
	</header><br><br><br><br>
			<div id="menu">
				<ul  style="padding-left:100">
					<li><a href="head.html">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<li><a href="about.html">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<li><a href="waste.html">Waste</a>
						<ul>
							<li><a href="electronic.html">Electronic</a>
							<li><a href="food.html">Food</a>
							<li><a href="paper.html">Paper</a>
							<li><a href="plastic.html">Plastic</a>
							<li><a href="cloth.html">Clothe</a>
							<li><a href="medi.html">Medicine</a>
						</ul>
					<li><a href="4.html">People Can Do!!</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<li><a href="test.html">Gallery</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<li><a href="feed.html">Feedback Form</a>&nbsp;&nbsp;&nbsp;&nbsp;
				
							
				</ul>
			</div><br><br><br>	
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname ="data";
$name1="'".$_POST["fname"]."'";
$last="'".$_POST["lname"]."'";
$email1="'".$_POST["email"]."'";
$subject1="'".$_POST["subject"]."'";
//create connection
$conn = new mysqli($servername, $username, $password, $dbname);
//check connection
if($conn->connect_error) {
	die("Connection failed:" . $conn->connect_error);
	}
$sql= "INSERT INTO tb1 VALUES ($name1,$last,$email1,$subject1)";
if ($conn->query($sql) == TRUE)
{
	echo"<h1> Your query/suggestion has been updated.We will reconnect with you after sometime ..</h1>";
}
else 
{
	echo "Error:" .$sql. "<br>" . $conn->error;
}
$conn->close();
?>
</body>
</html>