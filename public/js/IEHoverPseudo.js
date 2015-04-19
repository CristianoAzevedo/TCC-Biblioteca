window.onload = IEHoverPseudo;

/*
 *	C�digo publicado por Nick Rigby baseado
 *  no original de Patrick Griffiths para
 *  resolver o bug do IE6 (n�o suporta
 *  a pseudoclasse :hover em elementos que
 *  n�o sejam �ncoras).
 */
 function IEHoverPseudo()
 {
 	var navItens = document.getElementById('menu').getElementsByTagName('li');
	for (var i=0; i < navItens.length; i++)
	{
		if(navItens[i].className == 'submenu')
		{
			navItens[i].onmouseover = function(){ this.className += ' over'; }
			navItens[i].onmouseout = function(){ this.className = 'submenu'; }
		}
	}
 }