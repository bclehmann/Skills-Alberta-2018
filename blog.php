<?php
    $conn=mysqli_connect('localhost','competitor9','zr4V3h','competitor9');
    
    $stmt=$conn->prepare("SELECT * FROM blogs WHERE 1=? ORDER BY date ASC");
    
    $one=1;
    $stmt->bind_param('i', $one); //i for int, d for double, s for string, b for blob
    
    $stmt->execute();
    
    $result=$stmt->get_result();
    
    $blogs=[];
    
    if($result->num_rows > 0){
        while($row=$result->fetch_assoc()){
            array_push($blogs, $row);
        }
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Rundle Investments | Blog</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/bootstrap.min.css">
        
        <link rel="stylesheet" type="text/css" href="/main.css"><link rel="icon" href="images/logoSquare.gif " type="image/gif">
        
    </head>
    <body>
    	<div class="container">
        	<?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'navbar.php'; ?>
       
       		<h2>Rundle Investments | Blog</h2>
           <section>
           <?php 
           
                foreach ($blogs as $key => $item) {
                    ?>
                        <h3><a href="blogRead.php?q=<?= $item['id'] ?>"><?= $item['title'] ?></a></h3>
                        
                        <br/>
                        
                    <?php
                }
           
           ?>
           </section>
           
        </div>
        
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'endLine.php'; ?>
    </body>
</html>
