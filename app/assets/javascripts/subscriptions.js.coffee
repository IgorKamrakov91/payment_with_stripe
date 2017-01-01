jQuery ->
  # need to put actual key for token generation
  Stripe.setPublishableKey('pk_test_6pRNASCoBOKtIshFeQd4XMUh');

  $('#payment-form').submit(event) ->
    $form = $(this)
    $form.find('button').prop 'disabled', true
    Stripe.card.createToken $form, stripeResponseHandler
    false

stripeResponseHandler = (status, response) ->
  # Grab the form:
  $form = $('#payment-form')
  if response.error
    # Problem!
    # Show the errors on the form:
    $form.find('.payment-errors').text response.error.message
    $form.find('.submit').prop 'disabled', false
    # Re-enable submission
  else
    # Token was created!
    # Get the token ID:
    token = response.id
    # Insert the token ID into the form so it gets submitted to the server:
    $form.append $('<input type="hidden" name="stripeToken">').val(token)
    # Submit the form:
    $form.get(0).submit()
  return
