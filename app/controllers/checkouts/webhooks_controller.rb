class Checkouts::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, :validate_access

  def create
    checkout_event = verify_stripe_webhook

    if checkout_event["type"] == "checkout.session.completed"

      session = Stripe::Checkout::Session.retrieve({
         id: checkout_event["data"]["object"]["id"]
       })
       
      user = User.find_by(email: session.customer_details.email)
      user.trips.create! name: "Untitled trip", stripe_order_id: session.id
       
    end

    head :ok
  end

  private

  def verify_stripe_webhook
    event = nil
    begin
      sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
      payload = request.body.read
      event = Stripe::Webhook.construct_event(payload, sig_header, Rails.application.credentials.stripe_signing_secret)
    rescue JSON::ParserError => e
      # Invalid payload
      render status: 400
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      render status: 400
    end
  end
end
