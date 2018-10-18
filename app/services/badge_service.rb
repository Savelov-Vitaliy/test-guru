class BadgeService
  include ApplicationHelper, OcticonsHelper # for use helper: show_badge()

  RULES  = [:with_category, :with_level, :on_first_try]

  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
    users_test_passages = TestPassage.where(user_id: @user.id).select(:test_id, :correct_questions)
    @tests_passages = users_test_passages.map(&:test_id)
    @passed_tests = users_test_passages.select{|tp| tp.passed?}.map(&:test_id)
  end

  def reward()
    Badge.all.each {|badge| add_badge(badge) if reward?(badge)}
    @message
  end

  private

  def add_badge(badge)
    @user.badges << badge
    @message ||= I18n.t(".your_new_achievements")
    @message += show_badge(badge)
  end

  def reward?(badge)
    send badge.rule, badge.param
  end

  def with_category(category)
    if @test.category.title == category
      all_tests = Category.find_by(title: category).tests.ids
      (all_tests - @passed_tests).empty?
    end
  end

  def with_level(level)
    if @test.level == level.to_i
      all_tests = Test.where(level: level).ids
      (all_tests - @passed_tests).empty?
    end
  end

  def on_first_try(*param)
    @tests_passages.count(@test.id) == 1
  end

end