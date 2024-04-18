class FulfillCheckout
  def call(event)
    object = event.data.object
    
    return if object.payment_status != "paid"
    
    Rails.logger.info object.id
  end
end
