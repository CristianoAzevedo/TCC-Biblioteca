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

function devolucao(id,args)
{
	if(id > 0){
		alert("Emprestimo em atraso, será gerado uma multa por cada dia em atraso");
	}
	
	//alert("dias atraso="+id+"&idEmprestimo="+args);
	$.ajax({
		url: baseUrl+'/index.php/admin/devolucao/insert',
		data: "diasAtraso="+id+"&idEmprestimo="+args,
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
			alert("Devolução realizada com sucesso!");
			window.location.reload();
		}
	});
}