class Happening < ApplicationRecord
  belongs_to :day
  belongs_to :trip, through: :day
  delegated_type :happeningable, types: %w[ transportation activity ]
end
