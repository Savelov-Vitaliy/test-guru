module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elemetary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    I18n.t("tests.level.#{TEST_LEVELS[test.level]}") || test.level
  end

end
