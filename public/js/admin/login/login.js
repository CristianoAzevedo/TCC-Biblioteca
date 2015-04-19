$().ready(function(){	
	
	//$("#formLogin").validate();
	
	$("#dialog").dialog({
		open: function(event,ui) { 
			$(".ui-dialog-titlebar-close").hide(); 
		},
		title:"BIBLIOTECA VIRTUAL",
		modal:true,
		closeOnEscape: false,
		height: 'auto',
		width: 'auto'
	});
	
	
	var options = {
		caps_lock_on: function() { $("#caps").html("A tecla Caps Lock est� ativada!"); },
		caps_lock_off: function() { $("#caps").html(""); },
		caps_lock_undetermined: function() { $("#caps").text("Caps Lock undetermined"); },
		debug: true
	};
		
	$("#senha, #usuario").capslock(options);
	
});