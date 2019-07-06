<?php
$comments=[];
if(isset($_GET['q'])){
    $blog_id=$_GET['q'];
    
    
    $conn=mysqli_connect('localhost','competitor9','zr4V3h','competitor9');
    
    //$stmt=$conn->prepare("SELECT * FROM products  WHERE prod_id=?");
    
    $stmt=$conn->prepare("SELECT * FROM comments
                                  WHERE blog=? ORDER BY id DESC");
    
    
    $stmt->bind_param('i', $blog_id); //i for int, d for double, s for string, b for blob
    
    $stmt->execute();
    $result=$stmt->get_result();
    
    
    
    if($result->num_rows > 0){
        while($row=$result->fetch_assoc()){
            array_push($comments, $row);
        }
    }
}
foreach ($comments as $key => $item) {
    echo '<section style="margin-bottom:20px;">';
    echo '<h6>' . $item['username'] . '</h6>';
    echo '<div>' . nl2br($item['comment']) . '</div>';
    echo '</section>';
}

?>

<link rel="stylesheet" href="/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/main.css"><link rel="icon" href="images/logoSquare.gif " type="image/gif">

