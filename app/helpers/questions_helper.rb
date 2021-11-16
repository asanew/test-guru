module QuestionsHelper
  def question_header(question)
    head_text = question.persisted? ? 'Редактирование' : 'Создание'
    head_text << " вопроса теста #{question.test.title}"
  end
end
