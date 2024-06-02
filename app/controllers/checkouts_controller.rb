class CheckoutsController < ApplicationController 
  def new
    session = Stripe::Checkout::Session.create({
      customer_email: Current.user.email,
      client_reference_id: params[:trial_trip],
      line_items: [ {
        price: "price_1PNKMcRxS8JaBOK0p4oS1G5C",
        quantity: 1
      } ],
      mode: "payment",
      success_url: params[:trial_trip] ? trip_url(params[:trial_trip]) : new_trip_url,
      cancel_url: trips_url
    })

    redirect_to session.url, status: :see_other, allow_other_host: true
  end
end
