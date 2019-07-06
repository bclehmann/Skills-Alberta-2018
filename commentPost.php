<?php
if(isset($_POST['username']) && isset($_POST['blog_id']) && isset($_POST['comment'])){
    
    $conn=mysqli_connect('localhost','competitor9','zr4V3h','competitor9');
    
    $stmt=$conn->prepare('INSERT INTO comments (blog, username, comment) VALUES (?,?,?)');
    
    $stmt->bind_param('iss', $_POST['blog_id'], $_POST['username'], $_POST['comment']); //i for int, d for double, s for string, b for blob
    
    $stmt->execute();
    
}