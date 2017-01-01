jQuery ->
  Stripe.setPublishableKey('pk_test_6pRNASCoBOKtIshFeQd4XMUh');

  $('#payment-form').submit(event) ->
    $form = $(this)

    $form.find('button').prop 'disabled', true
    Stripe.card.createToken $form, stripeResponseHandler

    false
