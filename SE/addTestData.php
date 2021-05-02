<?php
    session_start();
    include 'koneksi.php';

    $username = $_SESSION['username'];
    $query1 = mysqli_query($koneksi, "SELECT * FROM tbuser WHERE username = '$username'");
    $row = mysqli_fetch_assoc($query1);
    
    $id= htmlspecialchars($_POST['id_user']);
    $query2 = mysqli_query($koneksi, "SELECT * FROM tbuser WHERE id = '$id'");
    $data = mysqli_fetch_assoc($query2);
    
    $name = $data['name'];
    $testcentrename=  $row['testcentrename'];
    
    //test_data
    $symptom = htmlspecialchars($_POST['symptoms']);
    $patient_type=htmlspecialchars($_POST['patient_type']);


    $addData = mysqli_query($koneksi, "insert into tbtestreport values('','$id','$name','$patient_type','$symptom','','pending','$testcentrename')");
    
    if($addData>0){
        echo"<script>alert('Successfully record test data');
            location.href='test_data.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to record new data');
            location.href='test_data.php';
        </script>";
    }

    if($query>0){
        echo"<script>alert('Successfully record new patient');
            location.href='test_data.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to record new data');
            location.href='test_data.php';
        </script>";
    }
?>