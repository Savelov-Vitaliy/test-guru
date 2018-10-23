class Badge < ApplicationRecord

  COLORS = [:red, :yellow, :lime, :green, :blue, :indigo, :black, :gray]
  RULES = [:with_category, :with_level, :on_first_try]
  #enum rule:[:with_category, :with_level, :on_first_try]

end
