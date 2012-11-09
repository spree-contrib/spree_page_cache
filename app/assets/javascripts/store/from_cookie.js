var App = App || {};

App.isNumeric = function(input) {
  return (input - 0) == input && input.length > 0;
};

App.fromCookie =  {

  updateDom: function(){
    var currentUserId = $.cookie('current_user_id'),
      cartAmount = decodeURIComponent($.cookie('cart_amount'));

    if(App.isNumeric(currentUserId)){
      $('#nav-bar li.logout').show();
      $('#nav-bar li.account').show();
    } else {
      $('#nav-bar li.login').show();
    }

    $('#link-to-cart').html(cartAmount).show();
  }
};

$(function(){
  App.fromCookie.updateDom();
});
