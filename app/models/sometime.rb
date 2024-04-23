class Sometime < ApplicationRecord
  belongs_to :trip, touch: true
end
