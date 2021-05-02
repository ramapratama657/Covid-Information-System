<?php
include 'koneksi.php';
if(isset($_GET['id']))    
{
    $id = $_GET['id'];
    $name= htmlspecialchars($_POST['name']);
    $stock=htmlspecialchars($_POST['stock']);

    $query = mysqli_query($koneksi, "UPDATE tbtestkit set testkitname= '$name', stock= '$stock' WHERE id= $id");


    if($query>0){
        echo"<script>alert('Successfully update the data');
            location.href='manage_kit.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to update the data');
            location.href='manage_kit.php';
        </script>";
    }
}
?>