<?php
session_start();
include 'koneksi.php';
if($_SESSION['stat_login'] != true){
		echo '<script>window.location="index.php"</script>';
	}

    $id_pegawai = $_POST['id_pegawai'];
    $tgl_daftar = $_POST['tgl_daftar'];
    $nm_pegawai = $_POST['nm_pegawai'];
    $tmp_lahir = $_POST['tmp_lahir'];
    $tgl_lahir = $_POST['tgl_lahir'];
    $jk = $_POST['jk'];
    $agama = $_POST['agama'];
    $almt_pegawai = $_POST['almt_pegawai'];
    $telp = $_POST['telp'];
    $id_bagian = $_POST['id_bagian'];

    //query update
    $queryupdate = mysqli_query($conn, "UPDATE pegawai SET nm_pegawai='$nm_pegawai' , tmp_lahir='$tmp_lahir' , tgl_lahir='$tgl_lahir' , jk='$jk' , agama='$agama' , almt_pegawai='$almt_pegawai' , telp='$telp', id_bagian='$id_bagian' WHERE id_pegawai='$id_pegawai' ");

    if ($queryupdate) {
        # credirect ke page index
        echo '<script>alert("Data Pegawai dengan ID '. $id_pegawai .' Sudah Diubah");
        window.location="data-pegawai.php"</script>';
    }
    else{
        echo "ERROR, data gagal diupdate". mysqli_error($conn);
    }
?>