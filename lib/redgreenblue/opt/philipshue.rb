class RGB

  # Returns the arguments required by the Philips Hue API to set a light to this RGB object's hue, saturation and brightness (HSB).
  #
  # When formatted as JSON, this hash can be used
  # directly to set a light's state.
  def to_philips_hue_api_hsb_arguments(black_off=true)
    my_hsb = hsb

    # Black means 'off'
    if black_off and ( my_hsb[2] == 0 )
      { 'on'  => false }

    else
      {

        # On/Off state of the light
        'on'  => true,

        # Brightness 1..254
        # Note: a brightness of 1 will not switch the light off
        'bri' => (  my_hsb[2]        * 253 + 1     ).round,

        # Hue 0..65535
        'hue' => (( my_hsb[0] || 0 ) * 65535 / 360 ).round,

        # Saturation 0..254
        'sat' => (  my_hsb[1]        * 254         ).round

      }

    end
  end

end
