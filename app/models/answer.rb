class Answer < ApplicationRecord	
  belongs_to :question

  validates :body, presence: true
  validate :max_answers_question

  scope :correct, -> { where(correct: true) }

  private

  def max_answers_question
    if question.answers.reload.count > ( self.new_record? ? 3 : 4 )
      errors.add(:question, 'слишком много ответов на один вопрос')
    end
  end
end
