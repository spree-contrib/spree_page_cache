var App = App || {};

App.updateCartAmount = function(value) {
	if (value) {
		$('#link-to-cart').html(value);
	}
};

$(function(){

	$.ajax({
		url: '/page_caching_info',
		dataType: 'json',
		success: function(data){
			App.updateCartAmount(decodeURIComponent(data.cart_amount));
		}
	});

});

