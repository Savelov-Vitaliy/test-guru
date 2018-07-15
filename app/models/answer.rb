class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers, on: :create

  private

  def validate_answers
    errors.add(:question, "У одного вопроса не может быть больше четырех ответов!") if question.answers.count >= 4
  end
end
