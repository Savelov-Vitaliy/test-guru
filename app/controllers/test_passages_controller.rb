class TestPassagesController < AuthenticatedController

  before_action :set_test_passage, only: %i[show result update gist gist_params]
  before_action :set_time, only: %i[show result update]

  def show
  end

  def result
    flash.notice = t(".time_is_up") if time_is_up?
    test = @test_passage.test
    tests_passages = TestPassage.where(user_id: @test_passage.user.id).map {|tp| tp}
    passed_tests = TestPassage.where(user_id: @test_passage.user.id).map {|tp| tp.test if tp.passed?}
    Badge.all.each { |badge| add_badge(badge) if badge.reward? test, passed_tests, tests_passages } if @test_passage.passed?
  end

  def update
    @test_passage.accept!(params[:answers_ids])

    if @test_passage.completed? or time_is_up?
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

  def set_time
    @timer = @test_passage.test.timer
    @time_start = @test_passage.created_at
  end

  def time_is_up?
    (Time.now - @time_start) > @timer if @timer > 0
  end

  def add_badge(badge)
    current_user.badges << badge
    flash.notice ||= I18n.t(".your_new_achievements")
    flash.notice += helpers.show_badge(badge)
  end
end
