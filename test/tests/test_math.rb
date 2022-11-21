require 'test/unit'

require 'redgreenblue'

class Test_math < Test::Unit::TestCase

  def test_zip_add
    assert_equal [100, -5, 3.6], RGB.new.send('zip_add', [90 , 0, 3.6], [10, -5.0, 0])
    assert_equal [10 , -5, 3.6], RGB.new.send('zip_add', [nil, 0, 3.6], [10, -5.0, 0])
  end

  def test_angle_of_travel
    c = RGB.new
    [
      [   0,  340,  340],
      [ 180,    0,  180],
      [-179,    0,  181],
      [  40,   10,   50],
      [ -40,   50,   10],
    ].each do |a,s,d|
      assert_equal a, c.send('angle_of_travel', s, d)
    end
  end

end
