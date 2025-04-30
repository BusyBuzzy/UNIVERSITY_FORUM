<div class="text-dark">
<h2 class="h5 text-dark mb-3"><i class="fas fa-user"></i> View All Users</h2>
<table class="table table-bordered table-hover table-responsive text-dark text-center">
    <thead class="thead-light">
        <tr>
            <th>User ID</th>
            <th>Browser</th>
            <th>IP Address</th>
            <th>Login Time</th>
            <th>Logout Time</th>
        </tr>
    </thead>

    <tbody>
        <?php
        global $connection;
        $query = "SELECT * 
                  FROM login_logs 
                  JOIN users ON login_logs.user_id = users.user_id";

        $logs = mysqli_query($connection, $query);

        while ($row = mysqli_fetch_assoc($logs)) {
            $username = $row['username'];
            $browser = $row['browser'];
            $ip = $row['ip_address'];
            $login_time = $row['login_time'];
            $logout_time = $row['logout_time'];

            echo "<tr>";
            echo "<td> $username </td>";
            echo "<td> $browser </td>";
            echo "<td> $ip </td>";
            echo "<td> $login_time </td>";
            echo "<td> $logout_time </td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>
</div>
