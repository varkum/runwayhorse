class PaymentsController < ApplicationController
  def new
    Current.user.set_payment_processor :stripe
    
    @checkout_session = Current.user.payment_processor.checkout(mode: "payment", line_items: "price_1P6zKiRxS8JaBOK0NjwwKf8D", success_url: new_trip_url, cancel_url: trips_url )
    
    Pay::Webhooks.delegator.subscribe "stripe.checkout.session.completed", FulfillCheckout.new
    
    redirect_to @checkout_session.url, allow_other_host: true, status: :see_other
  end
end