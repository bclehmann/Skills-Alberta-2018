<?php
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Cache-Control: no-cache");
header("Pragma: no-cache");
header("Content-type:application/json");

$conn=mysqli_connect('localhost','competitor9','zr4V3h','competitor9');

$stmt=$conn->prepare("SELECT * FROM roi WHERE 1=? ORDER BY roi.id ASC");
$one=1;
$stmt->bind_param('i', $one); //i for int, d for double, s for string, b for blob

$stmt->execute();

$result=$stmt->get_result();

$json=[];

if($result->num_rows > 0){
    while($row=$result->fetch_assoc()){
        array_push($json, $row);
    }
}

echo json_encode($json);