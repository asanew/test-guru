class Answer < ApplicationRecord
  MAX_ANSWERS_PER_QUESTION = 4

  belongs_to :question

  validates :body, presence: true
  validate :max_answers_question, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def max_answers_question
    if question.answers.count >= MAX_ANSWERS_PER_QUESTION
      errors.add(:question, 'слишком много ответов на один вопрос')
    end
  end
end
