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
});

function efetivaremprestimo(id,args,dados)
{
	$.ajax({
		url: baseUrl+'/index.php/admin/reserva/listagem',
		data: "idUsuarios="+id+"&idItem="+args+"&idReserva="+dados,
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
			alert("Emprestimo efetuado com sucesso");
			window.location.reload();
		}
	});
}