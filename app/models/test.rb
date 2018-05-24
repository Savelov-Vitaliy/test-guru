class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :light, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :category, -> (category) { joins(:category).where(categories: {title: category}).order(title: :desc) }

  validates :title, presence: true, uniqueness: { scope: :level,  message: "Тест с такими title и level уже есть в базе" }
  validates :level, numericality: { greater_than: 0, only_integer: true }

end
