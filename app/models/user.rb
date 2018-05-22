class User < ApplicationRecord

  def tests_level(level)      
      Test.joins(:user_test).where(user_tests: {user_id: self.id}, level: level)
  end

end
