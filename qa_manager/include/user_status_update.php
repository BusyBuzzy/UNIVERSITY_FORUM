<?php

include "../include/db.php";

if(isset($_GET['status']) && isset($_GET['u_id'])){
    $user_id = $_GET['u_id'];
    $select_user_query = mysqli_query($connection, "SELECT * FROM users WHERE user_id = $user_id LIMIT 1");
    if($user = mysqli_fetch_assoc($select_user_query)){ 
        $query = "UPDATE users SET 
                status = '" . ($_GET['status'] == 'active' ? '1' : ($_GET['status'] == 'locked' ? '0' : 'status')) . "'
                WHERE user_id = '{$user_id}'";
        $create_user_update_query =mysqli_query($connection, $query);

        if (!$create_user_update_query) {
            die("QUERY FAILED" . mysqli_error($connection));
        }
        else{
            //echo var_dump($query);
            echo "<script>window.location.href='../user.php'</script>";
        }
        
    } else {
        echo "<script>alert('No user found!')</script>";
        echo "<script>window.location='../user.php'</script>";
    }
}