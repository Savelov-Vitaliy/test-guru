class TestPassagesController < AuthenticatedController

  OCTOKIT_CLIENT = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'] )

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
    result = GistQuestionService.new(@test_passage.current_question, OCTOKIT_CLIENT).call

    flash_options = if gist_new(result)
      { notice: (view_context.link_to t('.success'), result.html_url, target: "_blank") }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def gist_new(result)
    Gist.new(gist_params(result.html_url)).save if result.respond_to?(:html_url)
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
