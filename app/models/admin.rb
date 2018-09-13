class Admin < User
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :first_name, :last_name, presence: true

end
