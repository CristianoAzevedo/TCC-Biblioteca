function submitForm(metodo, data, div)
{	
	$.ajax({
		type: "POST",
		url: metodo,
		data: data,
		dataType: "html",
		beforeSend: function(){
			//$.blockUI();
		},
		complete:function(){
			//$.unblockUI();
		},		
		success: function(response){
			$("#"+div).html(response);
			
		},
		error: function(){
			$("#"+div).html("Ocorreu um erro durante a execucao");
		}		
	});	
}