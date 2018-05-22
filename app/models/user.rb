class User < ApplicationRecord

  def tests_level(level)
      Test.joins("JOIN answers ON answers.test_id = tests.id").where("tests.level = :level AND answers.user_id = :id",  id: self.id, level: level)
  end

end
