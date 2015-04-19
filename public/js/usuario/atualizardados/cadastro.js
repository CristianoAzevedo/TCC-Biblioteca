$().ready(function(){
	
	$( "#tabs" ).tabs();
	
	$(insertUsuarios).validate({
		submitHandler: function() { 
			crudInsert(); 
		},
		rules: {
			senha: {
				required: true,
				minlength: 6
			},	
			Rptsenha: {
				required: true,
				minlength: 6
			}
		}		
	});	
	
	$("#Rptsenha").change(function(){
		var senha = $(this).val();
		
		if(senha != $("#senha").val()){
			alert("Senhas não conferem!");
			$("#senha").val("");
			$("#Rptsenha").val("");
		}
	});
	
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

function reservaitem(id,arg){
	$( "#confirma" ).dialog( "destroy" );
	$("#msg").html("Confirma a reserva do item do acervo");
	if(arg == 0){
		$( "#confirma" ).dialog({
			modal: true,
			buttons: {
				Sim: function(){
					$.ajax({
						url: baseUrl+'/index.php/usuario/reserva/cadastro',
						data: "idItem= "+id+"&status="+arg,
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
							alert('Item reservado.você tem até 24horas para efetivar o emprestimo');
							window.location.reload();
						}
					});
					$( this ).dialog( "close" );
				},
				Não: function() {
					$( this ).dialog( "close" );
				}
			}
		}); 
	}else{
		alert('Item indisponível');
	}
}