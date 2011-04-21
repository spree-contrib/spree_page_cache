$(function() {

  var flash = JSON.parse($.cookie('flash'));

  if(flash){
    if(flash.notice){
	  $('div.flash.notice').html(flash.notice.replace(/\+/g," ")).show();
    }

    if(flash.error){
      $('div.flash.errors').html(flash.error.replace(/\+/g," ")).show();
    }

	$.cookie('flash', '{}', { path: '/' });
	$.cookie('flash', '{}');
	$.cookie('flash', null);
  }
});

