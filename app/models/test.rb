class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :all_by_category, -> (category) { joins(:category).where(categories: {title: category}).order(title: :desc) }

  validates :level, numericality: { greater_than: 0, only_integer: true }
  validates :title, presence: true, uniqueness: { scope: :level,  message: "Тест с такими title и level уже есть в базе" }
  
  def self.category_title(category)
    all_by_category(category).pluck(:title) 
  end

end
