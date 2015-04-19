$(function(){
    $(".myMenu").buildMenu(
    {
      template:"menuVoices.html",
      additionalData:"pippo=1",
      menuWidth:200,
      openOnRight:false,
      menuSelector: ".menuContainer",
      iconPath:baseUrl+"/img/ico/",
      hasImages:true,
      fadeInTime:100,
      fadeOutTime:300,
      adjustLeft:2,
      minZindex:"auto",
      adjustTop:10,
      opacity:.95,
      shadow:false,
      shadowColor:"#ccc",
      hoverIntent:0,
      openOnClick:true,
      closeOnMouseOut:false,
      closeAfter:1000,
      submenuHoverIntent:0
    });

    $(".vertMenu").buildMenu(
    {
      template:"menuVoices.html",
      menuWidth:170,
      openOnRight:true,
      menuSelector: ".menuContainer",
      iconPath:baseUrl+"/img/ico/",
      hasImages:true,
      fadeInTime:0,
      fadeOutTime:0,
      adjustLeft:0,
      adjustTop:0,
      opacity:.95,
      openOnClick:false,
      minZindex:200,
      shadow:false,
      hoverIntent:0,
      submenuHoverIntent:0,
      closeOnMouseOut:true
    });

    $(document).buildContextualMenu(
    {
      template:"menuVoices.html",
      menuWidth:200,
      overflow:2,
      menuSelector: ".menuContainer",
      iconPath:baseUrl+"/img/ico/",
      hasImages:false,
      fadeInTime:0,
      fadeOutTime:0,
      adjustLeft:0,
      adjustTop:0,
      opacity:.99,
      closeOnMouseOut:false,
      onContextualMenu:function(o,e){}, //params: o = the contextual menu,e = the event
      shadow:false
    });
  });

  function recallcMenu(el){
    if (!el) el= $.mbMenu.lastContextMenuEl;
    var cmenu=+$(el).attr("cmenu");
    $(cmenu).remove();
  }