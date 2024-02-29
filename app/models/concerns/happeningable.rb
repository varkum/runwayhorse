module Happeningable
  extend ActiveSupport::Concern
  
  included do
    has_one :happening, as: :happeningable, touch: true
    delegate :date, to: :happening, allow_nil: true
  end
end