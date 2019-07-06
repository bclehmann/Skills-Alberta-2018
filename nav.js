$(document).ready(function(){
	var expanded=false;
	
	
	$("#navButton").click(function(){
		expanded=expanded?false:true;//Inverts the variable
		
		
		$("#linkCluster").toggle();
		if(expanded){
			$('.jumbotron').css('padding-bottom', '100%');
		}else{
			$('.jumbotron').css('padding-bottom', '2rem');//Bootstrap default
		}
	});
});