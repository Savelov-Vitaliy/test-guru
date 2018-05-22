class Test < ApplicationRecord
belongs_to :category
has_many :user_test

  def self.tests_category(category)    
    joins(:category).where(categories: {title: category}).order(id: :desc).pluck(:title)    
  end

end
