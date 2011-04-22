var App = App || {};

App.fromCookie =  {

	isNumeric: function(input) {
		return (input - 0) == input && input.length > 0;
	},

	udpateDom: function(){
		var	currentUserId = $.cookie('current_user_id'),
			cartAmount = $.cookie('cart_amount');

		if(isNumeric(currentUserId)){
			$('#nav-bar li.logout').show();
			$('#nav-bar li.account').show();
		} else {
			$('#nav-bar li.login').show();
		}

		$('#nav-bar li.cart-indicator').html(cartAmount).show();
	}
};


$(function(){

	App.fromCookie.updateDom();

});
