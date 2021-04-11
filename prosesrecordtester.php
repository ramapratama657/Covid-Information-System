<?php
    include 'koneksi.php';
    
    $username=$_POST['username'];
    $password=$_POST['password'];
    $testername=$_POST['testername'];
    $testcentrename=$_POST['testcentrename'];

    $query = mysqli_query($koneksi, "insert into tbtester values('','$username','$password','$testername','$testcentrename')");

    if($query>0){
        echo"<script>alert('Record Test Centre Success');
            location.href='manage_tester.php';
        </script>";
    }

    else{
        echo"<script>alert('Record Test Centre Failed');
            location.href='manage_tester.php';
        </script>";
    }
?>