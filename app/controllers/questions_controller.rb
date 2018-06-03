class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: Question.find(params[:id]).inspect
  end

  def new
    
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
    render plain: "Воспрос id <%= params[:id]) %>  был удален."
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_test_not_found
    render plain: "Test was not found." 
  end

end
