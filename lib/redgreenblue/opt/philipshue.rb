# Optional support for Philips Hue lights.
#
# Conforms to Bridge API 1.35 for Philips Hue, published 20-Nov-2019.
# See (regrettably requires registration):
# - https://developers.meethue.com/develop/hue-api/

# Automatically load core RGB class before loading options.
require 'redgreenblue'

class RGB

  # Returns a hash with the arguments required by the Philips Hue API
  # to set a light to this RGB object's hue, saturation and brightness (HSB).
  # Only available when optional support for Philips Hue lights is loaded (require 'redgreenblue/opt/philipshue').
  #
  # Formatted as JSON, this hash can be sent to a bridge to set a light's state.
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
