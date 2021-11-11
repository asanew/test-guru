module QuestionsHelper
  def question_header
    head_text = ( action_name == 'new' || action_name == 'create' ) ? 'Создание ' : 'Редактирование '
    head_text << "вопроса теста #{@test.title}"
  end
end
