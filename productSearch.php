<?php

?>
<!DOCTYPE html>
<html>
    <head>
        <title>Rundle Investments | Products</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/main.css"><link rel="icon" href="images/logoSquare.gif " type="image/gif">
        
        <script src="/jquery-3.3.1.min.js"></script>
        <script src="/productSearch.js"></script>
    </head>
    <body>
    	<div class="container">
        	<?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'navbar.php'; ?>
        	
        	<h2>Products</h2>
        	
        	<p id="blurb">
        		Rundle Investments is pleased to offer 13 mutual funds that meet a wide variety of investment needs and risk profiles. Our funds offer 
no-load investing-no sales or trailing commissions, no set-up fees, and no purchase, transfer, or redemption fees. Our Management Expense Ratios (MERs) are among the lowest in Canada.
To view a detailed fund profile, select the fund name below. 
        		
        	</p>
        	
        	<form id="searchForm">
        		<input type="text" id="searchBar" name="q" placeholder="Search Products" /><input id="searchSubmit" type="submit" value="Go!" />
        		<!-- Submit button is actually useless, but it makes the user feel better -->
        		
        	</form>
        	<div id="results">
        		
        	</div>
        	
        	
        </div>
        
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'endLine.php'; ?>
    </body>
</html>
