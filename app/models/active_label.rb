class ActiveLabel < ApplicationRecord
  belongs_to :trip, optional: true
  belongs_to :user
end
