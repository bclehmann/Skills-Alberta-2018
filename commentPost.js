

var ajax= (function(){
	
	var reset=function(){
		$('#frameContainer').html($('#frameContainer').html());//Hopefully refreshes iframe
		document.getElementById('commentForm').reset();
	}
	
	var send=function(){
		jQuery.post('commentPost.php', $("#commentForm").serialize(), function (){
			reset();
		});
	}
	
	return{//Data to be visible, all will still be accessible within the closure of visible methods
		send:send
	}
	
})();

$(document).ready(function(){
	$("#commentForm").on('submit', function(e){//Execute on enter or submit button is clicked
		e.preventDefault();//Prevent actually submitting the form
		ajax.send();
	});
});