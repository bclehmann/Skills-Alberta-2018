<?php
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Cache-Control: no-cache");
header("Pragma: no-cache");
header("Content-type:application/json");

$conn=mysqli_connect('localhost','competitor9','zr4V3h','competitor9');

$stmt=$conn->prepare("SELECT prod_name, prod_id, id FROM products
                            INNER JOIN roi ON products.prod_id=roi.foreign_id
                            WHERE roi.id= ?  ORDER BY roi.id ASC");
$stmt->bind_param('i', $_POST['q']); //i for int, d for double, s for string, b for blob

$stmt->execute();

$result=$stmt->get_result();

$json=[];

if($result->num_rows > 0){
    while($row=$result->fetch_assoc()){
        $json=$row;
    }
}

echo json_encode($json);