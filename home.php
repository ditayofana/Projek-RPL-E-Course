<?php
session_start();
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING); // Adjust error reporting

include "koneksi.php";

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    die("Anda belum login");
}

$username = $_SESSION['username'];
$level = $_SESSION['level'];

// Redirect based on user level
if ($level == 'Admin') {
    header("Location: dashboard.html");
    exit(); // Make sure to call exit after redirection
} elseif ($level == 'User') {
    header("Location: dashboardUser.html");
    exit(); // Make sure to call exit after redirection
} else {
    die("Level tidak dikenali");
}
?>
