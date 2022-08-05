<?php 
	include 'koneksi.php';

	if(isset($_GET['id'])){
		$delete = mysqli_query($conn, "DELETE FROM log_perubahan WHERE id_perubahan = '".$_GET['id']."' ");
		echo '<script>alert("Data Bagian dengan Sudah Dihapus");
        window.location="log-update.php"</script>';
	}
?>