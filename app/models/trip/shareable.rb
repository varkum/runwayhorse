module Shareable < ActiveSupport::Concern
  included do
    generates_token_for :sharing do
      name&.last(5)
    end
  end
end
