class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[start show edit update destroy]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
    @author_id = current_user.id
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to admin_tests_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_url
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_url
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end


  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

end
