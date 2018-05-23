class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :answers

  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :user

  def self.category(category)    
    joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)    
  end

end
