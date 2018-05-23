class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  def tests_with_level(level)      
    tests.where(level: level)
  end

end
