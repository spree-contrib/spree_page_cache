var App = App || {};

App.updateCartAmount = function(value) {
  if (value) {
    $('#link-to-cart').html(value);
  }
};

App.updateAccountStatusBar = function(value) {
  if(App.isNumeric(value)){
    $('#nav-bar li.logout').show();
    $('#nav-bar li.account').show();
    $('#nav-bar li.login').hide();
  } else {
    $('#nav-bar li.login').show();
    $('#nav-bar li.logout').hide();
    $('#nav-bar li.account').hide();
  }
};

App.updateAuthToken = function(value) {
  $.cookie('authenticity_token', value, { path: '/' });
  $('meta[name="csrf-token"]').attr('content', value);
  $("input[name='authenticity_token']").val(value);
};

App.customMethod = function(data){
  //does nothing, just an easy method for an app
  //to replace with some custom logice to happen
  //when the page caching info repsonse arrives
};

App.pageCached = function(){
  //replacable method that controls if page_caching_info
  //ajax request is executed or not. 
  return true;
}

$(function(){
  if($.cookie('authenticity_token')!=null){
    App.updateAuthToken($.cookie('authenticity_token'));
  }

  if(App.pageCached()){
    $.ajax({
      url: '/page_caching_info.json',
      dataType: 'json',
      success: function(data){
        App.updateCartAmount(decodeURIComponent(data.cart_summary));
        App.updateAccountStatusBar(data.current_user_id);
        App.updateAuthToken(data.authenticity_token);
        App.customMethod(data);
      }
    });
  }

});

