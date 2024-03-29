class Lodging < ApplicationRecord
  belongs_to :trip
  has_many :days
end
