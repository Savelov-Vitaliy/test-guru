class TestPassagesController < AuthenticatedController

  before_action :set_test_passage, only: %i[show result update gist gist_params]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answers_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result_object = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result_object.success?
      gist_new(result_object)
      { notice: (view_context.link_to t('.success'), result_object.html_url, target: "_blank") }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def gist_new(result)
    Gist.new(gist_params(result.html_url)).save
  end

  def gist_params(github_url)
    {
      question: @test_passage.current_question,
      user: current_user,
      github_url: github_url
    }
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
