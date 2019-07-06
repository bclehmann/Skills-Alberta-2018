<?php
    include $_SERVER['DOCUMENT_ROOT'] . '/' . 'DateStr.php';
    $success=false;
    if(isset($_GET['q'])){
        $prod_id=$_GET['q'];
        $prod=[];
        
        
        $conn=mysqli_connect('localhost','competitor9','zr4V3h','competitor9');
        
        //$stmt=$conn->prepare("SELECT * FROM products  WHERE prod_id=?");
        
        $stmt=$conn->prepare("SELECT * FROM products
                              INNER JOIN categories ON products.cat_id=categories.cat_id
                              WHERE prod_id=? ");
        
        
        $stmt->bind_param('i', $prod_id); //i for int, d for double, s for string, b for blob
        
        $stmt->execute();
        $result=$stmt->get_result();
        
        if($result->num_rows > 0){
            while($row=$result->fetch_assoc()){
                $prod=$row;
                $prod['fund_net_asset_value']=number_format($prod['fund_net_asset_value']);
                $prod['total_net_asset_value']=number_format($prod['total_net_asset_value']);
                
                
                $prod['investment_strategy']=str_replace('’', "'", $prod['investment_strategy']);
                $prod['invests_in']=str_replace('’', "'", $prod['invests_in']);
                $prod['investor_suitability']=str_replace('’', "'", $prod['investor_suitability']);
                
                $dateObj=new DateStr($prod['inception_date']);
                $prod['inception_dateStr']=$dateObj->dateStr;
                
                $success=true;
            }
        }
    }
    
    if(!$success){
        header("Location: /ProductSearch.php"); /* Redirect browser */
        die();
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Rundle Investments | <?= $prod['prod_name'] ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/main.css"><link rel="icon" href="images/logoSquare.gif " type="image/gif">
    </head>
    <body>
    	<div class="container">
    		<!--  Title -->
        	<?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'navbar.php'; ?>
        	
        	<h2><?=  $prod['cat_name'] . ' > ' .  $prod['prod_name'] ?> <span class="red"><?=$prod['active']?'':'CLOSED';  ?></span></h2>
        	<section>
            	
            	<h4>Managed by <span class="grey"><?= $prod['manager'] ?></span></h4>
            	<h6><?php 
                	for ($i=0; $i< $prod['rating']; $i++){
                	    echo '<img src="/images/fa/raw-svg/solid/star.svg" width="10px" alt="' . $prod['rating'] . ' stars">';
                	}
            	?>
            	<?= ' ' . $prod['rating'] ?> Stars on Morningstar &nbsp; Incepted on <?= $prod['inception_dateStr'] ?></h6>
            	<h6><?= $prod['RRSP']?'RRSP Eligible':'RRSP Not Eligible'; ?></h6>
            	<span class="row">
           			<span class="col-6">
                    	<h3><?='$' . $prod['fund_net_asset_value'] . ' Million in Fund Net Asset Value' ?></h3>
                    	<h3><?='$' . $prod['total_net_asset_value'] . ' Million in Total Net Asset Value' ?></h3>
                	</span><span class="col-6">
                    	<h3><?=$prod['net_asset_value_per_unit']? '$' . $prod['net_asset_value_per_unit']/100.0 . ' Net Asset Value Per Unit':'' ?></h3>
                    	<h3><?= $prod['trading_expense_ratio']? $prod['trading_expense_ratio'] . '% Trading Expense Ratio':'' ?></h3>
        			</span>
        		</span>
        	</section>
        	<hr/>
        	<section>
            	<h3>What does this fund invest in?</h3>
            	<p><?= $prod['invests_in']?></p>
            	
            	<h3>Who is this fund suitable for?</h3>
            	<p><?= $prod['investor_suitability']?></p>
            	
            	<h3>Investment Strategy</h3>
            	<p><?= $prod['investment_strategy']?></p>
        	</section>
        </div>
        
        <?php include $_SERVER['DOCUMENT_ROOT'] . '/' . 'endLine.php'; ?>
    </body>
</html>
