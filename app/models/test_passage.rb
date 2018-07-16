class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_save :before_save_set_current_question, on: :create

  PASSING_SCORE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def questions_count
    test.questions.count
  end

  def score
    correct_questions * 100 / test.questions.count
  end

  def passed?
    score >= PASSING_SCORE
  end

  private

  def before_save_set_current_question
    self.current_question = set_current_question
  end

  def set_current_question
    if current_question.nil? && test.present?
      test.questions.first
    else
      next_question
    end
  end

  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if !answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end
end
