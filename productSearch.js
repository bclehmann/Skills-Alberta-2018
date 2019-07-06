

var ajax= (function(){
	
	var data=[];
	var query=function(){
		jQuery.post('productJSON.php', $("#searchForm").serialize(), function(returned) {
			data=returned;
		});
	}
	var refresh=function(){
		query();
		
		if($("#searchBar").val()!=""){
			var output="";
			data.forEach(function(item, i) {
				output+="<a href='product.php?q="+item['prod_id']+"'>"+item['prod_name']+"</a><br/>";
			});
			$("#results").html(output);
		}else{
			$("#results").html("");
		}
	}
	
	return{//Data to be visible, all will still be accessible within the closure of visible methods
		refresh:refresh
	}
	
})();

$(document).ready(function(){
	$("#searchForm").on('keyup', function(){//Execute after the change
		ajax.refresh();
	});
	$("#searchForm").on('input', function(){//Support use of right-click copy-paste
		ajax.refresh();
	});
	$("#searchForm").on('submit', function(e){//Execute on enter or submit button is clicked
		e.preventDefault();//Prevent actually submitting the form
		ajax.refresh();
	});
});