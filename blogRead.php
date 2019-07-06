<?php
    include $_SERVER['DOCUMENT_ROOT'] . '/' . 'DateStr.php';
    $success=false;
    if(isset($_GET['q'])){
        $blog_id=$_GET['q'];
        
        
        $conn=mysqli_connect('localhost','competitor9','zr4V3h','competitor9');
        
        //$stmt=$conn->prepare("SELECT * FROM products  WHERE prod_id=?");
        
        $stmt=$conn->prepare("SELECT * FROM blogs
                                  WHERE blogs.id=? ");
        
        
        $stmt->bind_param('i', $blog_id); //i for int, d for double, s for string, b for blob
        
        $stmt->execute();
        $result=$stmt->get_result();
        
        $blog=[];
        
        if($result->num_rows > 0){
            while($row=$result->fetch_assoc()){
                $blog=$row;
                $dateObj=new DateStr($blog['date']);
                $blog['dateStr']=$dateObj->dateStr;
                
                $success=true;
            }
        }
    }

    if(!$success){
        header("Location: /blog.php"); /* Redirect browser */
        die();
    }
    
    
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Rundle Investments | <?= $blog['title'] ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/main.css"><link rel="icon" href="images/logoSquare.gif " type="image/gif">
        
        <script src="/jquery-3.3.1.min.js"></script>
        <script src="/commentPost.js"></script>
    </head>
    <body>
    	<div class="container">
    		<!--  Title -->
        	<?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'navbar.php'; ?>
        	
        	<h2><?=$blog['title'] ?></h2>
        	<h4><?='By ' . $blog['author'] . ' on ' . $blog['dateStr'];?></h4>
        	<h6><?=$blog['reading_time'] . ' minute read' ?></h6>
        	
        	<p>
        		<?php  include $_SERVER['DOCUMENT_ROOT'] . '/' . $blog['path'];?>
        	</p>
        	<hr/>
        	<h3>User Comments</h3>
        	<br/>
        	<div id="frameContainer">
            	<iframe width="100%" style="border:none;" id="commentFrame" src="comments.php?q=<?= $blog_id ?>">
            	</iframe>
        	</div>
        	<hr/>
        	<h3>Post Your Own Comments</h3>
        	<br/>
        	<form id="commentForm">
        		<input type='hidden' value='<?= $blog_id ?>' name='blog_id'/>
        		<input type='text' placeholder='Username' id='username' name='username'/><br/>
        		<textarea placeholder='Your comment here' cols='50' rows='5'  id='comment' name='comment'> </textarea><br/>
        		<input type='submit'>
         	</form>
        </div>
        
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'endLine.php'; ?>
    </body>
</html>
