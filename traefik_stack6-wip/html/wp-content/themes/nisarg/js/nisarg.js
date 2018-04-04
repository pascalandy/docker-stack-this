/**
 * Makes the top level navigation menu item clickable
 */

(function($){
    
    //handles top level menu item without children
    $( '.navbar-nav > li.menu-item > a' ).click( function(){
    	if($(this).attr('target') != '_blank' && $(this).attr('class') != 'dropdown-toggle')    		
          window.location = $( this ).attr( 'href' );   	
    });

    //handles top level menu item having children
    $( '.navbar-nav > li.menu-item > .dropdown-toggle' ).click( function(){
    	if($(this).attr('target') == '_blank')
          window.open(this.href); // $( this ).attr( 'href' );   
        else
          window.location = $( this ).attr( 'href' );   		
    });

    $('.dropdown').hover(function() {
        $(this).addClass('open');
    },
    function() {
        $(this).removeClass('open');
    });

    var setHeight = function (h) {
		
	height = h;

	$("#cc_spacer").css("height", height + "px");
	}

	$(window).resize(function(){
		setHeight($("#navigation_menu").height());
	})

	$(window).ready(function(){
		setHeight($("#navigation_menu").height());
	})


})(jQuery);

