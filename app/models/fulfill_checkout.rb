class FulfillCheckout
  def call(event)
    object = event.data.object
    
    return if object.payment_status != "paid"
    
    Rails.logger.info("HERE: #{object.id}")
  end
end
