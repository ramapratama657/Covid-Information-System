<?php
include 'koneksi.php';
if(isset($_GET['id']))    
{
    $id = $_GET['id'];
    $testcentrename= htmlspecialchars($_POST['testcentrename']);

    $query = mysqli_query($koneksi, "UPDATE tbtestcentre set testcentrename= '$testcentrename' WHERE id= $id");


    if($query>0){
        echo"<script>alert('Successfully update the data');
            location.href='testcentre.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to update the data');
            location.href='testcentre.php';
        </script>";
    }
}
?>