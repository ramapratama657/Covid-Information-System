<?php
include 'koneksi.php';
if(isset($_GET['id']))    
{
    $id = $_GET['id'];
    $result= htmlspecialchars($_POST['result']);
    $status=htmlspecialchars($_POST['status']);

    $query = mysqli_query($koneksi, "UPDATE tbtestreport set result= '$result', status= '$status' WHERE id= $id");


    if($query>0){
        echo"<script>alert('Successfully update the data');
            location.href='test_data.php';
        </script>";
    }

    else{
        echo"<script>alert('Failed to update the data');
            location.href='test_data.php';
        </script>";
    }
}
?>