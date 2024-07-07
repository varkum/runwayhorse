class Activity < ApplicationRecord
  include Happeningable
  
  FORM_PARAMS = [ :name, :location ]
end
