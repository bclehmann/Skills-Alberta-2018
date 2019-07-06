<?php

?>
<!DOCTYPE html>
<html>
    <head>
        <title>Rundle Investments</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/bootstrap.min.css">
        
        <link rel="stylesheet" type="text/css" href="/main.css"><link rel="icon" href="images/logoSquare.gif " type="image/gif">
        
        <script src="/jquery-3.3.1.min.js"></script>
        <script src="/investments.js"></script>
        
    </head>
    <body>
    	<div class="container">
        	<?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'navbar.php'; ?>
       
       <h2>Return on Investments</h2>
       <br/>
       <section id="independentScroll">
           <canvas id="canvas">
           </canvas>
       </section>
        </div>
        
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'endLine.php'; ?>
    </body>
</html>
