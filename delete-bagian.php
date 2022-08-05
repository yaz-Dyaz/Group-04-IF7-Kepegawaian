<?php 
	include 'koneksi.php';

	if(isset($_GET['id'])){
		$delete = mysqli_query($conn, "DELETE FROM bagian WHERE id_bagian = '".$_GET['id']."' ");
		echo '<script>alert("Data Bagian dengan Sudah Dihapus");
        window.location="data-bagian.php"</script>';
	}
?>