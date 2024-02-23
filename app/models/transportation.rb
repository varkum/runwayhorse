class Transportation < ApplicationRecord
  include Happeningable
  
  delegate :date, to: :happening, allow_nil: true
  
  enum :mode, %i[ plane car train boat ]
end
