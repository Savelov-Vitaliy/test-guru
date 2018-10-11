class Badge < ApplicationRecord

  RULES  = [:with_category, :with_level, :on_first_try]
  COLORS = [:red, :yellow, :lime, :green, :blue, :indigo, :black, :gray]

  def reward?(test, passed_tests, tests_passages)
    @test = test
    @passed_tests = passed_tests
    @tests_passages = tests_passages
    #log "#{rule}, #{param}"
    send rule, param
  end

  private

  def with_category(category)
    if @test.category.title == category
      all_tests = Category.find_by(title: category).tests
      (all_tests - @passed_tests).empty?
    end
  end

  def with_level(level)
    if @test.level == level.to_i
      all_tests = Test.where(level: level)
      (all_tests - @passed_tests).empty?
    end
  end

  def on_first_try(*param)
    @tests_passages.count(@test) == 1 #? true : false
  end

end
