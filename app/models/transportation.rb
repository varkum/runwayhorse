class Transportation < ApplicationRecord
  include Happeningable

  enum :mode, %i[ plane car train ]
  
  FORM_PARAMS = [ :mode, :origin, :destination, :arrival ]
end
