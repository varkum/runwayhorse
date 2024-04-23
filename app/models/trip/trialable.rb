module Trip::Trialable
  extend ActiveSupport::Concern
  
  included do
    has_one :trial, dependent: :destroy
  end
  
  def activate_trial
    create_trial! start_date: Date.today
  end
  
  def on_trial?
    trial.present?
  end
  
  def end_trial
    trial.destroy!
  end
end
