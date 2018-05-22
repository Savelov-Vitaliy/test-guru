class Test < ApplicationRecord

  def self.tests_category(category)
    belongs_to :category
    Test.select(:title).joins(:category).where(:categories => {title: category}).order(id: :desc)    
  end

end
