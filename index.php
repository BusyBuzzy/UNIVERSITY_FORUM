<!-- this is for login page -->
<?php require_once "include/header.php"; ?>


<?php

if (isset($_POST['login'])) {


    //when  click the login button the following condition start working
    $the_user_email    =  mysqli_real_escape_string($connection, $_POST['user_email']);
    $the_user_password =  mysqli_real_escape_string($connection, $_POST['password']);


    $query             =  "SELECT * FROM users WHERE user_email = '$the_user_email' AND user_password = '$the_user_password' ";
    $check_user_query  =  mysqli_query($connection, $query);
    $count_user_row    =  mysqli_num_rows($check_user_query);

    if ($count_user_row > 0) {

        while ($row = mysqli_fetch_array($check_user_query)) {

            $db_user_id       =  $row['user_id'];
            $db_username      =  $row['username'];
            $db_user_email    =  $row['user_email'];
            $db_user_password =  $row['user_password'];
            $db_role_id       =  $row['role_id'];
            $db_dept_id       =  $row['dept_id'];
            $db_last_login    =  $row['last_login'];


            $query            =  "SELECT * FROM roles WHERE role_id = {$db_role_id}";
            $check_role_query =  mysqli_query($connection, $query);

            while ($row = mysqli_fetch_assoc($check_role_query)) {

                $role_type = $row['role_type'];
            }


            if ($role_type === 'admin') {

                $_SESSION['user_id']     =  $db_user_id;
                $_SESSION['username']    =  $db_username;
                $_SESSION['user_email']  =  $db_user_email;
                $_SESSION['role_id']     =  $db_role_id;
                $_SESSION['dept_id']     =  $db_dept_id;
                $user_id = $db_user_id;

                if ($db_last_login == null) {
                    echo "<script>alert('Hello Admin. This is First time Login. Welcome to UniVCT Platform');</script>";
                    echo "<script>window.location='admin/index.php'</script>";
    
                    $update_last_login = "UPDATE users SET last_login = NOW() WHERE user_id = '$user_id'";
                    mysqli_query($connection, $update_last_login);
                } else {
                    echo "<script>alert('Hello Admin. Last login: $db_last_login');</script>";
                    echo "<script>window.location='admin/index.php'</script>";
    
                    $update_last_login = "UPDATE users SET last_login = NOW() WHERE user_id = '$user_id'";
                    mysqli_query($connection, $update_last_login);
                }

            } else if ($role_type === 'qa_manager') {

                $_SESSION['user_id']     =  $db_user_id;
                $_SESSION['username']    =  $db_username;
                $_SESSION['user_email']  =  $db_user_email;
                $_SESSION['role_id']     =  $db_role_id;
                $_SESSION['dept_id']     =  $db_dept_id;
                $user_id = $db_user_id;
              
                if ($db_last_login == null) {
                    echo "<script>alert('Hello QA Manager. This is First time Login. Welcome to UniVCT Platform')</script>";
                    echo "<script>window.location='qa_manager/index.php'</script>";
                
                    $update_last_login = "UPDATE users SET last_login = NOW() WHERE user_id = '$user_id'";
                    mysqli_query($connection, $update_last_login);
                } else {
                    echo "<script>alert('Hello QA Manager. Last login: $db_last_login')</script>";
                    echo "<script>window.location='qa_manager/index.php'</script>";
                
                    $update_last_login = "UPDATE users SET last_login = NOW() WHERE user_id = '$user_id'";
                    mysqli_query($connection, $update_last_login);
    
                }


            } else if ($role_type === 'qa_coordinator') {

                $_SESSION['user_id']     =  $db_user_id;
                $_SESSION['username']    =  $db_username;
                $_SESSION['user_email']  =  $db_user_email;
                $_SESSION['role_id']     =  $db_role_id;
                $_SESSION['dept_id']     =  $db_dept_id;
                $user_id = $db_user_id;

                if ($db_last_login == null) {
                    echo "<script>alert('Hello QA Coordinator. This is First time Login. Welcome to UniVCT Platform')</script>";
                    echo "<script>window.location='qa_coordinator/index.php'</script>";
    
                    $update_last_login = "UPDATE users SET last_login = NOW() WHERE user_id = '$user_id'";
                    mysqli_query($connection, $update_last_login);

                } else {
                    echo "<script>alert('Hello QA Coordinator. Last login: $db_last_login')</script>";
                    echo "<script>window.location='qa_coordinator/index.php'</script>";
    
                    $update_last_login = "UPDATE users SET last_login = NOW() WHERE user_id = '$user_id'";
                    mysqli_query($connection, $update_last_login);
    
                }
                
            } else {

                $_SESSION['user_id']     =  $db_user_id;
                $_SESSION['username']    =  $db_username;
                $_SESSION['user_email']  =  $db_user_email;
                $_SESSION['role_id']     =  $db_role_id;
                $_SESSION['dept_id']     =  $db_dept_id;
                $user_id = $db_user_id;
               
                if ($db_last_login == null) {
                    echo "<script>alert('Hello Staff. This is First time Login. Welcome to UniVCT Platform')</script>";
                    echo "<script>window.location='staff/index.php'</script>";
    
                    $update_last_login = "UPDATE users SET last_login = NOW() WHERE user_id = '$user_id'";
                    mysqli_query($connection, $update_last_login);
                } else {
                    echo "<script>alert('Hello Staff. Last login: $db_last_login')</script>";
                    echo "<script>window.location='staff/index.php'</script>";
    
                    $update_last_login = "UPDATE users SET last_login = NOW() WHERE user_id = '$user_id'";
                    mysqli_query($connection, $update_last_login);
                }
              
            }
        }
    } else {

        echo "<script>alert('Username or Password is wrong')</script>";
        echo "<script>window.location='index.php'</script>";
    }
}

?>


<!--html form for login box-->

<body class="" style="background-color: #2DA491;">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center mt-5">

            <div class="col-xl-10 col-lg-12 col-md-9 mt-5">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block" style="background-image: url('img/tc.png'); background-position:center; background-size:cover;"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-800 mb-4">Welcome to UniVCT!</h1>
                                        <h1 class="h6 text-gray-800 mb-4">Made by Team Complex</h1>
                                    </div>
                                    <form action="index.php" method="post" class="user">
                                        <div class="form-group">
                                            <input name="user_email" type="email" class="form-control form-control-user"
                                                id="exampleInputName" aria-describedby=""
                                                placeholder="Enter Your Email..." required>
                                        </div>
                                        <div class="form-group">
                                            <input name="password" type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password" required>
                                        </div>
                                        <hr>
                                        <div>

                                            <button name="login" class="btn btn-primary btn-user btn-block">Login</button>

                                        </div>

                                    </form>

                                    <hr>
                                
                                </div>
                          
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Footer -->

    <?php require_once "include/footer.php"; ?>