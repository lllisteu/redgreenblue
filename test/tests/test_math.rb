require 'test/unit'

require 'redgreenblue'

class Test_math < Test::Unit::TestCase

  def test_zip_add
    assert_equal [100, -5, 3.6], RGB.new.send('zip_add', [90 , 0, 3.6], [10, -5.0, 0])
    assert_equal [10 , -5, 3.6], RGB.new.send('zip_add', [nil, 0, 3.6], [10, -5.0, 0])
  end

end
