<?php
    include 'koneksi.php';
    
    $testkitname=$_POST['testkitname'];
    $stock=$_POST['stock'];
    $testcentrename=$_POST['testcentrename'];

    $query = mysqli_query($koneksi, "insert into tbtester values('','$testkitname','$stock','$testcentrename')");

    if($query>0){
        echo"<script>alert('Record Test Centre Success');
            location.href='manage_kit.php';
        </script>";
    }

    else{
        echo"<script>alert('Record Test Centre Failed');
            location.href='manage_kit.php';
        </script>";
    }
?>