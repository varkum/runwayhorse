class Transportation < ApplicationRecord
  include Happeningable

  enum :mode, %i[ plane car train ]
end
