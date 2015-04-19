$().ready(function(){
	
	$( "#tabs" ).tabs();
	
	$("#dialog").dialog({
        closeOnEscape: false,
		modal: true,
        autoOpen: false,
        buttons: {
			Ok: function() {
				$( this ).dialog( "close" );
			}
		}
    });	
	
	$("#matricula").change(function(){

		$.ajax({
			type:"POST",
			url: baseUrl+'/index.php/admin/emprestimo/getuserbymatr',
			data: "matricula="+$(this).val(),
			datatype: "html",
			beforeSend:function(){
				//$.blockUI();
			},
			complete:function(){
				//$.unblockUI();
			},
			erro:function(){
				alert('erro de requisição');
			},
			success:function(retorno){	
			
				
			}
		});
		
	});
});
