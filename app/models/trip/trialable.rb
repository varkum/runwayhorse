module Trip::Trialable
  extend ActiveSupport::Concern
  
  included do
    has_one :trial, dependent: :destroy
  end
  
  def activate_trial
    create_trial! started_on: Date.today
  end
  
  def on_trial?
    trial.present?
  end
  
  def end_trial
    trial.destroy!
  end
  
  def expired_trial?
    stripe_order_id.blank? && !on_trial?
  end
end
