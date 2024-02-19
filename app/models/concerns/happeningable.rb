module Happeningable
  extend ActiveSupport::Concern
  
  included do
    has_one :happening, as: :happeningable, touch: true
  end
end