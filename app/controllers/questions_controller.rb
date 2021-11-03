class QuestionsController < ApplicationController
  before_action :set_test, only: :index

  def index
    @questions = @test.questions
    render inline: "<% @questions.each do |q| %><p><%= q.body %></p><% end %>"
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
  end
end
