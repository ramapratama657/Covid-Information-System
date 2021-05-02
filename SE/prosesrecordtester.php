<?php
    session_start();
    include 'koneksi.php';
    
    $username= htmlspecialchars($_POST['username']);
    $password_plain=htmlspecialchars($_POST['password']);
    $testername=htmlspecialchars($_POST['testername']);
    $testcentrename=htmlspecialchars($_POST['testcentrename']);

    $password= password_hash($password_plain, PASSWORD_DEFAULT);
    $query = mysqli_query($koneksi, "insert into tbuser values('','$username','$password','tester','$testername','$testcentrename')");

    if($query>0){
        echo"<script>alert('Successfully record new tester');
            location.href='manage_tester.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to record new tester');
            location.href='manage_tester.php';
        </script>";
    }
?>