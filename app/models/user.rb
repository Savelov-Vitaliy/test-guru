class User < ApplicationRecord

  def tests_with_level(level)      
      Test.joins(:test_passage).where(test_passages: {user_id: self.id}, level: level)
  end

end
