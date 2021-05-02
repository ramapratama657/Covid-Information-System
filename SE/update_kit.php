<?php session_start();
$name = $_SESSION['username'];
if(!isset($_SESSION["username"])){
	echo"<script>alert('login first'); location.href='login.php'</script>";
	exit();
}
include 'koneksi.php';
if(isset($_GET['id']))    
{
    $id = $_GET['id'];
    $query = mysqli_query($koneksi,"SELECT * FROM tbtestkit WHERE id= $id");
    $row= mysqli_fetch_assoc($query);
}
?>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- CSS -->
    <link rel="stylesheet" href="style.css">

    <title>Dashboard</title>
   
</head>
<body data-new-gr-c-s-check-loaded="8.872.0" data-gr-ext-installed="">
<!-- Just an image -->
<nav class="navbar navbar-light p-0 ml-4">
    <a class="navbar-brand" href="#">
       <img src="img/logo.png" alt="CTIS" style="width: 60%;">
       <button class="btn btn-light" id="menu-toggle"><i class="fa fa-bars"></i></button>
    </a>  
    <li class="navbar navbar-light nav-item dropdown mr-5">
        <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i>
        <?=$name;?>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
        <a class="dropdown-item" href="logout.php">Logout</a>
        </div>
    </li> 
</nav>
<div id="wrapper" class="d-flex">
    <!-- Sidebar -->
    <div class=" border-right" id="sidebar-wrapper">
        <div class="sidebar-heading text-center">Welcome <?=$name?></div>
        <div class="list-group list-group-flush">
        <a href="dashboard_admin.php" class="list-group-item list-group-item-action text-center">Dashboard</a>
        <a href="test_report.php" class="list-group-item list-group-item-action text-center">Test Report</a>
        <a href="logout.php" class="list-group-item list-group-item-action text-center">Logout</a>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="container">
            <div class="card my-5 p-3">
                <div class="card-heading ">
                    <!-- Button trigger modal -->
                    <h2 class="card-title text-center">Update Test Kit</h2>
                </div>
                <div class="card-body">
                    <form action="updateKit.php?id=<?=$id;?>" method="post">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" name="name" class="form-control" value="<?=$row['testkitname']?>" required>
                        </div>
                        <div class="form-group">
                            <label for="test_centre">Stock</label>
                            <input type="number" name="stock" class="form-control" value="<?=$row['stock']?>" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

    </div>
</div>
<!-- Footer -->
<footer class="page-footer font-small blue">

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2021 Copyright:
      <a href="#"> Covid Testing Information System</a>
    </div>
    <!-- Copyright -->
  
</footer>
<!-- Footer -->
    <!--Footer-->
    
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>


    <!-- MD Javascript -->
    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>
    
</body>
</html>
