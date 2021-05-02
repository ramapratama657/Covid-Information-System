<?php
    include 'koneksi.php';
    
    $testkitname=$_POST['testkitname'];
    $stock=$_POST['stock'];
    $testcentrename=$_POST['testcentrename'];

    $query = mysqli_query($koneksi, "insert into tbtestkit values('','$testkitname','$stock','$testcentrename')");

    if($query>0){
        echo"<script>alert('Successfully add new test kit');
            location.href='manage_kit.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to add new test kit');
            location.href='manage_kit.php';
        </script>";
    }
?>