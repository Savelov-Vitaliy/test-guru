class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passage

  def self.category(category)    
    joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)    
  end

end
