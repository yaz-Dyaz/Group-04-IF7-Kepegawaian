<?php 
	include 'koneksi.php';

	if(isset($_GET['id'])){
		$delete = mysqli_query($conn, "DELETE FROM pegawai WHERE id_pegawai = '".$_GET['id']."' ");
		
		echo '<script>alert("Data Pegawai Sudah Dihapus");
        window.location="data-pegawai.php"</script>';
	}
?>