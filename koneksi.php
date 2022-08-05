<?php
	
	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db   = 'group_04_if-7_kepegawaian';

	$conn = mysqli_connect($host, $user, $pass, $db);

	if(!$conn){
		echo 'Error : ' .mysqli_connect_error($conn);
	}

?>