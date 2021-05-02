<?php
    session_start();
    include 'koneksi.php';

    $username = $_SESSION['username'];
    $query = mysqli_query($koneksi, "SELECT * FROM tbuser WHERE username = '$username'");
    $username= htmlspecialchars($_POST['username']);
    $password_plain=htmlspecialchars($_POST['password']);
    $name=htmlspecialchars($_POST['name']);
    $row = mysqli_fetch_assoc($query);
    $testcentrename=  $row['testcentrename'];
    //test_data
    $symptom = htmlspecialchars($_POST['symptoms']);
    $patient_type=htmlspecialchars($_POST['patient_type']);

    $password= password_hash($password_plain, PASSWORD_DEFAULT);
    $query = mysqli_query($koneksi, "insert into tbuser values('','$username','$password','patient','$name','$testcentrename')");
    $user_id =  mysqli_query($koneksi, "SELECT * FROM tbuser WHERE username = '$username'");
    $row_id =  mysqli_fetch_assoc($user_id);
    $id = $row_id["id"];
    $addData = mysqli_query($koneksi, "insert into tbtestreport values('','$id','$name','$patient_type','$symptom','','Pending','$testcentrename')");
    
    if($addData>0){
        echo"<script>alert('Successfully record test data');
            location.href='test_data.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to record new data report');
            location.href='test_data.php';
        </script>";
    }

    if($query>0){
        echo"<script>alert('Successfully record new patient');
            location.href='test_data.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to record new data user');
            location.href='test_data.php';
        </script>";
    }
?>