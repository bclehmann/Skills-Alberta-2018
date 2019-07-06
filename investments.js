var canvas;
var ctx;

var ajax= (function(){
	
	var data=[];
	var query=function(){
		jQuery.get('investmentsJSON.php',  function(returned) {
			data=returned;
			drawPoint();
		});
	};
	var lookup=function(id, i, colorArr){
		jQuery.post('productFromChart.php', 'q='+id, function(returned) {
			ctx.fillStyle=colorArr[i];
			ctx.fillText(returned['prod_name'], 750,10+i*10);
			
		});
		
	}
	
	var refresh=function(){
		query();
	};
	
	var drawPoint=function(){
		
		
		
		var colorArr=['red', 'blue' , '#ff0098', 'green', 'pink', 'orange', 'purple', '#00f6ff', 'brown', '#212696', '#d499ff', '#72ffad']
		data.forEach(function(item, i) {
			ctx.beginPath();
			
			var yArr=[item['3_month'], item['1_year'], item['2_year'], item['3_year'], item['4_year'], item['5_year'], item['10_year']];
			
			
			ctx.moveTo(100,(item['3_month']*-6.25)+125);
			
			for(var j=1; j<8; j++){
				
				var x=100*j;
				var y= (yArr[j-1]*-6.25)+125;
				if(y!=125){//Null, this does not allow any datapoint to be exactly zero
					ctx.lineTo(x,y);
				}
			}
			
			
			ctx.strokeStyle=colorArr[i];
			ctx.stroke();
			
			ctx.textAlign='left';
			ctx.font = "10px Arial";
			lookup(item['id'], i, colorArr);//Prints Legend
			
			
		});
		
	};
	
	return{//Data to be visible, all will still be accessible within the closure of visible methods
		refresh:query
	}
	
})();

$(document).ready(function(){
	draw();
	
});

function draw(){
	
	canvas = document.getElementById("canvas");

	ctx = canvas.getContext("2d");
	canvas.width = 1000;
	canvas.height = 250;
	ctx.scale(1, 1);
	
	ctx.lineWidth='2';
	ctx.strokeStyle='#000000';//blacc
	
	ctx.moveTo(10,10);
	ctx.lineTo(10,290);
	ctx.stroke();
	
	ctx.lineTo(990,290);
	ctx.stroke();
	
	ctx.textAlign='center';
	ctx.font = "30px Arial";
	ctx.fillText("3 Mo", 100, 250);
	ctx.fillText("1 Yr", 200, 250);
	ctx.fillText("2 Yr", 300, 250);
	ctx.fillText("3 Yr", 400, 250);
	ctx.fillText("4 Yr", 500, 250);
	ctx.fillText("5 Yr", 600, 250);
	ctx.fillText("10 Yr", 700, 250);
	
	
	ctx.moveTo(10,125);
	ctx.lineTo(1000,125);//Zero
	
	ctx.stroke();
	ctx.font = "14px Arial";
	ctx.lineWidth='1';
	
	ctx.strokeStyle='#EEEEEE';//Very light grey
	ctx.moveTo(10,10*-6.25+125)
	ctx.lineTo(1000,10*-6.25+125);//+10
	ctx.fillText('10%', 50, 10*-6.25+125-5);
	
	ctx.stroke();
	
	ctx.moveTo(10,-10*-6.25+125)
	ctx.lineTo(1000,-10*-6.25+125);//-10
	ctx.fillText('-10%', 50, -10*-6.25+125-5);
	
	ctx.stroke();
	
	ajax.refresh();
}