class TestPassagesController < AuthenticatedController

  before_action :set_test_passage, only: %i[show result update gist gist_params]

  def show
    timer = @test_passage.test.timer # = 100
    #timer ||= 100
    @timer ||= timer if timer > 0
  end

  def result
    test = @test_passage.test
    tests_passages = TestPassage.where(user_id: @test_passage.user.id).map {|tp| tp}
    passed_tests = TestPassage.where(user_id: @test_passage.user.id).map {|tp| tp.test if tp.passed?}
    Badge.all.each { |badge| add_badge(badge) if badge.reward? test, passed_tests, tests_passages } if @test_passage.passed?
  end

  def update
    @timer = params[:timer]
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
      Gist.create(**gist_params, github_url: result_object.html_url)
      { notice: (view_context.link_to t('.success'), result_object.html_url, target: "_blank") }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def gist_params
    {
      question: @test_passage.current_question,
      user: current_user
    }
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def add_badge(badge)
    current_user.badges << badge
    flash.notice ||= I18n.t(".your_new_achievements")
    flash.notice += helpers.show_badge(badge)
  end
end
