<?php
session_start();
include 'koneksi.php';
if($_SESSION['stat_login'] != true){
		echo '<script>window.location="index.php"</script>';
	}

    $id_bagian = $_POST['id_bagian'];
    $nama_bagian = $_POST['nama_bagian'];
    $gaji = $_POST['gaji'];
    $jml_staf = $_POST['jml_staf'];

    //query update
    $queryupdate = mysqli_query($conn, "UPDATE bagian SET nama_bagian='$nama_bagian' , gaji='$gaji' , jml_staf='$jml_staf' WHERE id_bagian='$id_bagian' ");

    if ($queryupdate) {
        # credirect ke page index
        echo '<script>alert("Data Bagian dengan ID '. $id_bagian .' Sudah Diubah");
        window.location="data-bagian.php"</script>';
    }
    else{
        echo "ERROR, data gagal diupdate". mysqli_error($conn);
    }
?>