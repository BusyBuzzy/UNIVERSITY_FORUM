<?php include "db.php"; ?>

<?php session_start(); ?>

<?php

	if (isset($_SESSION['user_id'])) {
		$user_id = $_SESSION['user_id'];

		$logout_time_query = "UPDATE login_logs SET logout_time = NOW() WHERE user_id = '$user_id' ORDER BY id DESC LIMIT 1";
		mysqli_query($connection, $logout_time_query);
	}

	//assign to the null for ending the session
	$_SESSION['user_id']     =  null;
	$_SESSION['username']    =  null;
	$_SESSION['user_email']  =  null;
	$_SESSION['role_id']     =  null;
	$_SESSION['dept_id']     =  null;

        echo "<script>alert('You logged out')</script>";
        echo "<script>window.location.href='../index.php' </script>";

?>