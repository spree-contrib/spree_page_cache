function IsNumeric(input)
{
   return (input - 0) == input && input.length > 0;
}


$(function() {

  var	currentUserId = $.cookie('current_user_id'),
		cartAmount = $.cookie('cart_amount');

	if(IsNumeric(currentUserId)){
		$('#nav-bar li.logout').show();
		$('#nav-bar li.account').show();
	} else {
		$('#nav-bar li.login').show();
	}

	$('#nav-bar li.cart-indicator').html(cartAmount).show();

});
