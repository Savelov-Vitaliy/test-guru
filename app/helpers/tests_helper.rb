module TestsHelper

  TEST_LEVELS = {
    0 => I18n.t('tests.level.easy'),
    1 => I18n.t('tests.level.elemetary'),
    2 => I18n.t('tests.level.advanced'),
    3 => I18n.t('tests.level.hard') }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || test.level
  end

end
