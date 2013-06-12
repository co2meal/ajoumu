
var payment;
jQuery(function() {

  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  return payment.setupForm();
});

payment = {

  setupForm: function() {

    $('#new_payment_history').submit(function() {
      $('#input[type=submit]').css('disabled', true);

      if($('#payment_history_stripe_card_token').val()){
        // $('#new_payment_history').submit();
        return true;
      }
      else{
        payment.processCard();
        return false;
      }
    });
  },

  processCard: function() {

    var card;
    card = {
      number: $('#card_number').val(),
      cvc: $('#card_code').val(),
      expMonth: $('#card_month').val(),
      expYear: $('#card_year').val()
    };
    return Stripe.createToken(card, payment.handleStripeResponse);
  },
  handleStripeResponse: function(status, response) {
    if (status === 200) {
      $('#payment_history_stripe_card_token').val(response.id)
      $('#stripe_error').remove();
      $('#new_payment_history').submit();
    } else {
      $('#stripe_error').addClass('error').text(response.error.message);
      $('input[type=submit]').css('disabled', false);
    }
  }
};
