/**
 * @abstract Cadastra Itens
 */

$().ready(function(){

	$('.ui-state-default').hover(
		function(){ $(this).addClass('ui-state-hover'); }, 
		function(){ $(this).removeClass('ui-state-hover'); }
	);
	$('.ui-state-default').click(function(){ $(this).toggleClass('ui-state-active'); });
	$('.icons').append(' <a href="#">Toggle text</a>').find('a').click(function(){ $('.icon-collection li span.text').toggle(); return false; }).trigger('click');
	
});