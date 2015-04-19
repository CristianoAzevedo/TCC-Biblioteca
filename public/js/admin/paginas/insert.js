/**
 * @abstract Cadastra Itens
 */

$().ready(function(){

	$( "#accordion" ).accordion();
	
	$( "#tabs" ).tabs();
	
	$("#formCadastro").validate();
	
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
	
	$( "#dialog-message" ).dialog({
		modal: true,
		buttons: {
			Ok: function() {
				$( this ).dialog( "close" );
			}
		}
	});	
	
});