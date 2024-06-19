<?php 
session_start();
include('includes/config.php');

// Generating CSRF Token
if (empty($_SESSION['token'])) {
    $_SESSION['token'] = bin2hex(random_bytes(32));
}

if (isset($_POST['submit'])) {
    // Verifying CSRF Token
    if (!empty($_POST['csrftoken'])) {
        if (hash_equals($_SESSION['token'], $_POST['csrftoken'])) {
            $name = $_POST['name'];
            $email = $_POST['email'];
            $comment = $_POST['comment'];
            $postid = intval($_GET['nid']);
            $st1 = '0';
            $query = mysqli_query($con, "INSERT INTO tblcomments(postId, name, email, comment, status) VALUES('$postid', '$name', '$email', '$comment', '$st1')");
            if ($query) {
                echo "<script>alert('Comment successfully submitted. Comment will be displayed after admin review.');</script>";
                unset($_SESSION['token']);
            } else {
                echo "<script>alert('Something went wrong. Please try again.');</script>";  
            }
        }
    }
}

$postid = intval($_GET['nid']);
$sql = "SELECT viewCounter FROM tblposts WHERE id = '$postid'";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $visits = $row["viewCounter"];
        $sql = "UPDATE tblposts SET viewCounter = $visits + 1 WHERE id ='$postid'";
        $con->query($sql);
    }
} else {
    echo "no results";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>E-Course | Home Page</title>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <?php include('includes/header.php');?>

    <!-- Page Content -->
    <div class="container">
        <div class="row" style="margin-top: 4%">
            <!-- Blog Entries Column -->
            <div class="col-md-8">
                <!-- Blog Post -->
                <?php
                $pid = intval($_GET['nid']);
                $currenturl = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
                $query = mysqli_query($con, "SELECT tblposts.PostTitle AS posttitle, tblposts.PostImage, tblposts.PostPdf, tblcategory.CategoryName AS category, tblcategory.id AS cid, tblsubcategory.Subcategory AS subcategory, tblposts.PostDetails AS postdetails, tblposts.PostingDate AS postingdate, tblposts.PostUrl AS url, tblposts.postedBy, tblposts.lastUpdatedBy, tblposts.UpdationDate FROM tblposts LEFT JOIN tblcategory ON tblcategory.id = tblposts.CategoryId LEFT JOIN tblsubcategory ON tblsubcategory.SubCategoryId = tblposts.SubCategoryId WHERE tblposts.id = '$pid'");
                while ($row = mysqli_fetch_array($query)) {
                ?>
                <div class="card mb-4">
                    <div class="card-body">
                        <h2 class="card-title"><?php echo htmlentities($row['posttitle']);?></h2>
                        <!-- Category -->
                        <a class="badge bg-secondary text-decoration-none link-light" href="category.php?catid=<?php echo htmlentities($row['cid'])?>" style="color:#fff"><?php echo htmlentities($row['category']);?></a>
                        <!-- Subcategory -->
                        <a class="badge bg-secondary text-decoration-none link-light" style="color:#fff"><?php echo htmlentities($row['subcategory']);?></a>
                        <p>
                            <b>Posted by </b> <?php echo htmlentities($row['postedBy']);?> on <?php echo htmlentities($row['postingdate']);?> |
                            <?php if ($row['lastUpdatedBy'] != ''): ?>
                            <b></b> <?php echo htmlentities($row['lastUpdatedBy']);?> on <?php echo htmlentities($row['UpdationDate']);?></p>
                            <?php endif;?>
                    
                            <b>Visits:</b> <?php print $visits; ?>
                            </p>
                            <hr />
                            <img class="img-fluid rounded" src="admin/postimages/<?php echo htmlentities($row['PostImage']);?>" alt="<?php echo htmlentities($row['posttitle']);?>">
                            <p class="card-text"><?php 
                            $pt = $row['postdetails'];
                            echo (substr($pt, 0));?></p>
                            <?php if ($row['PostPdf'] != ''): ?>
                            <hr />
                            <h4>Attached PDF:</h4>
                            <embed src="admin/postpdfs/<?php echo htmlentities($row['PostPdf']);?>" type="application/pdf" width="100%" height="600px" />
                            <?php endif; ?>
                    </div>
                    <div class="card-footer text-muted"></div>
                </div>
                <?php } ?>
            </div>

            <!-- Sidebar Widgets Column -->
            <?php include('includes/sidebar.php');?>
        </div>
        <!-- /.row -->
        <!---Comment Section --->
   

    </div>

    <?php include('includes/footer.php');?>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
