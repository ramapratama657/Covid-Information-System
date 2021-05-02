<?php
    session_start();

    //koneksi ke database
    include 'koneksi.php';
    /*
    //menangkap data yang dikirim dari form login
    $username = $_POST['username'];
    $password = $_POST['password'];

    //menyeleksi data user dengan username dan password yang sesuai
    $login = mysqli_query($koneksi, "select * from tblogin where username='$username'and password='$password'");
    */
    // menghitung jumlah data yang ditemukan    
    $cek = mysqli_num_rows($login);
 
    // cek apakah username dan password di temukan pada database
    if($cek > 0){
 
	    $data = mysqli_fetch_assoc($login);
 
	    // cek jika user login sebagai admin
	    if($data['levelakun']=="admin"){
 
		    // buat session login dan username
		    $_SESSION['username'] = $username;
		    $_SESSION['levelakun'] = "admin";
		    // alihkan ke halaman dashboard admin
		    header("location:dashboard_admin.php");
 
	    // cek jika user login sebagai pegawai
	    }else if($data['levelakun']=="tester"){
		    // buat session login dan username
		    $_SESSION['username'] = $username;
		    $_SESSION['levelakun'] = "tester";
		    // alihkan ke halaman dashboard pegawai
		    header("location:dashboard_tester.php");
 
	    // cek jika user login sebagai pengurus
	    }else if($data['levelakun']=="patient"){
		    // buat session login dan username
		    $_SESSION['username'] = $username;
		    $_SESSION['levelakun'] = "patient";
		    // alihkan ke halaman dashboard pengurus
		    header("location:dashboard_patient.php");
 
	    }else{
 
		    // alihkan ke halaman login kembali
		    header("location:login.php?pesan=errorlogin1");
	    }	
    }else{
	    header("location:login.php?pesan=errorlogin2");
    }

?>