class QuestionsController < ApplicationController
  before_action :set_test, only: %i(create new)
  before_action :set_question, only: %i(show edit update destroy)

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_from_question_not_found
    render plain: 'Вопрос не найден'
  end
end
