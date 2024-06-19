<?php
include 'koneksi.php';
$user = $_POST['username'];
$pass = md5($_POST['password']);
$fullname = $_POST['fullname'];
$email = $_POST['email'];
$level = $_POST['level'];
$sql = "INSERT INTO tblregister (username, password, email, namaLengkap, level)
VALUES ('$user', '$pass', '$email', '$fullname', '$level')";
if ($koneksi->query($sql) === TRUE) {
echo "<script>alert('Anda Sukses Registrasi!');
window.location = 'login.html';</script>";
} else {
echo "Error: " . $sql . "<br>" . $koneksi->error;
}
$koneksi->close();