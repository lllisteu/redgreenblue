require 'test/unit'

require 'redgreenblue'

class Test_hex < Test::Unit::TestCase

  def test_hex
    c = RGB.new

    c.rgb = [255, 0, 255]
    assert_equal 'ff00ff', c.hex
    assert_equal 'f0f', c.hex(true)

    c = RGB.hex '#0080ff'
    assert_equal '0080ff', c.hex
    assert_equal 0, c.red
    assert_equal 1, c.blue
    assert_equal 0.50, c.green.round(2)

    %w(#1a5 1a5 #11aa55 11aa55).each do |s|
      c.hex = s
      assert_equal '1a5', c.hex(true)
      assert_equal '11aa55', c.hex
    end
  end

  @@hex_data = [

    [ '#11aa55', '#1a5'   , [17, 170, 85] ],
    [ '11aa55' , '1a5'    , [17, 170, 85] ],
    [ '#11AA55', '#1A5'   , [17, 170, 85] ],
    [ '11AA55' , '1A5'    , [17, 170, 85] ],

    [ '#1a5'   , '#1a5'   , [17, 170, 85] ],
    [ '1a5'    , '1a5'    , [17, 170, 85] ],
    [ '#1A5'   , '#1A5'   , [17, 170, 85] ],
    [ '1A5'    , '1A5'    , [17, 170, 85] ],

    [ '#11Aa55', '#11Aa55', [17, 170, 85] ],
    [ '#12aa55', '#12aa55', [18, 170, 85] ],

    [ '', '', nil ],
    [ ' ', ' ', nil ],
    [ 'yellowishpink', 'yellowishpink', nil ],

  ]

  def test_parse
    @@hex_data.each do |hd|
      assert_equal hd[2], RGB.hex_to_rgb(hd[0])
    end
  end

  def test_shorthand
    assert_equal '#1a5', RGB.hex_shorthand('#11aa55')
    assert_equal '1a5',  RGB.hex_shorthand('11aa55')
    assert_equal '#1A5', RGB.hex_shorthand('#11AA55')
    assert_equal '1A5',  RGB.hex_shorthand('11AA55')

    assert_equal '#1a5', RGB.hex_shorthand('#1a5')
    assert_equal '1a5',  RGB.hex_shorthand('1a5')
    assert_equal '#1A5', RGB.hex_shorthand('#1A5')
    assert_equal '1A5',  RGB.hex_shorthand('1A5')

    assert_equal '#11Aa55', RGB.hex_shorthand('#11Aa55')
    assert_equal '#12aa55', RGB.hex_shorthand('#12aa55')
    assert_equal 'yellowish pink', RGB.hex_shorthand('yellowish pink')
  end

end
