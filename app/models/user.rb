class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author, class_name: 'Test', foreign_key: 'author_id'

  # validates :name, presence: true
  validates :email, presence: true,
                    format: { with: /\w+@\w+\.\w/, message: "only allows letters" },
                    uniqueness: { message: "User with this email already exists" }

  def tests_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
