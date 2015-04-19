$(function(){
	
	$.validator.setDefaults({
		submitHandler: function() { insert(); }
	});
	
	$("#formNews").validate({
		rules: {
			nome:{
				required: true,
				minlength:'4'
			},
			email: {
            	required: true,
            	email: true
			}			
		}
		
	});		
});

function insert(){

	$.ajax({
		type: "POST",
		url: baseUrl+'/newsletters/insert',
		data: $('#formNews').serialize(),
		dataType: "html",		
		success: function(response){
			$("#response").html(response);			
		},
		error: function(){
			$("#response").html("Erro durante execucao");
		}		
	});	
}