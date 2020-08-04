require 'test/unit'

require 'redgreenblue'

class Test_name < Test::Unit::TestCase

  def test_name
    c = RGB.new
    assert_nil c.name

    c.name = 'Orangey Grey'
    assert_equal 'Orangey Grey', c.name

    c.name = ''
    assert_nil c.name

    c.name = 'オレンジ色'
    assert_equal 'オレンジ色', c.name

    c.name = nil
    assert_nil c.name
  end

end
