module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elemetary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
   # I18n.t("tests.level.#{TEST_LEVELS[test.level]}") if (TEST_LEVELS[test.level].present?) || test.level
   # - странно, но эта строка выводит весь хэш:
   # {:easy=>"легкий", :elemetary=>"элементарный", :advanced=>"продвинутый", :hard=>"сложный"}

    TEST_LEVELS[test.level].present? ? I18n.t("tests.level.#{TEST_LEVELS[test.level]}"): test.level
  end

end
