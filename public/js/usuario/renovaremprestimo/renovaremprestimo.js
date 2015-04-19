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
	
	$( "#accordion" ).accordion();
	
	$( "#tabs" ).tabs();
	
	$("#formCadastro").validate();
	
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
});

function Renova(id,args){
	if(id==0){
		$.ajax({
			url: baseUrl+'/index.php/usuario/renovaremprestimo/cadastro',
			data: "idEmprestimo="+args,
			type:"POST",
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
			success:function(item){	
				alert("Renovação realizada com sucesso!");
				window.location.reload();
			}
		});
	}else{
		alert('Data de entrega ultrapassada, compareça a biblioteca para regularizar sua situação.');
	}
}