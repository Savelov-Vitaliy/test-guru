class BadgeService

  RULES  = [:with_category, :with_level, :on_first_try]

  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
    @passed_tests = @user.test_passages.where(successfull: true).map(&:test_id)
  end

  def reward
    Badge.all.each.with_object([]) {|badge, reward| reward << badge if reward?(badge)}
  end

  private

  def reward?(badge)
    send badge.rule, badge.param
  end

  def with_category(category)
    return if @test.category.title != category
    all_tests = Category.find_by(title: category).tests.ids
    (all_tests - @passed_tests).empty?
  end

  def with_level(level)
    return if @test.level != level.to_i
    all_tests = Test.where(level: level).ids
    (all_tests - @passed_tests).empty?
  end

  def on_first_try(*param)
    @user.test_passages.map(&:test_id).count(@test.id) == 1
  end

end