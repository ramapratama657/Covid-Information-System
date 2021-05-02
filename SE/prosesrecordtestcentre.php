<?php
    include 'koneksi.php';
    
    $testcentrename=$_POST['testcentrename'];

    $query = mysqli_query($koneksi, "insert into tbtestcentre values('','$testcentrename')");

    if($query>0){
        echo"<script>alert('Record Test Centre Success');
            location.href='testcentre.php';
        </script>";
    }

    else{
        echo"<script>alert('Record Test Centre Failed');
            location.href='testcentre.php';
        </script>";
    }
?>