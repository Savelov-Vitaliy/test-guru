class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit destroy update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def new
    @question = @test.questions.new
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question.test]
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to [:admin, @question.test]
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test), notice: "Вопрос '#{@question.body}' был удален."
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_test_not_found
    render plain: "Question was not found."
  end

end
