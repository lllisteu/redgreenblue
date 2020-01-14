require 'test/unit'

require 'redgreenblue/opt/philipshue'

class Test_opt_philipshue < Test::Unit::TestCase

  def test_hsb

    assert_equal %w(on bri hue sat), RGB.new.to_philips_hue_api_hsb_arguments.keys

    assert_equal ({ 'on' => false }), RGB.black.to_philips_hue_api_hsb_arguments

    assert_equal     0, RGB.new(1,0,0).to_philips_hue_api_hsb_arguments['hue']
    assert_equal 21845, RGB.new(0,1,0).to_philips_hue_api_hsb_arguments['hue']
    assert_equal 43690, RGB.new(0,0,1).to_philips_hue_api_hsb_arguments['hue']

    assert_equal   1, RGB.black.to_philips_hue_api_hsb_arguments(false)['bri']
    assert_equal 254, RGB.white.to_philips_hue_api_hsb_arguments['bri']

  end

end
