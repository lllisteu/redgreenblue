# History

## Changes

 * __General:__

    * Improved documentation.

 * __Core RGB class:__

    * Added `::each_24bit_color` iterator.

    * `::hex` and `#hex=` methods now raise an `ArgumentError` when fed an invalid hexadecimal string.
    
    * Added `::hex_to_rgb` method.

 * __Optional components:__

    * Added optional support for color terminals. You can enable this with `require 'redgreenblue/opt/terminal'`. This only works on terminals that support 24-bit colors, so-called "true color".
        * `#inspect` displays a 24-bit color swatch.
        * Added `#to_terminal_foreground_24bit` and `#to_terminal_background_24bit` methods.

## 0.7.0 (11 November 2019)

 * __General:__

    * Improved documentation.

 * __Core RGB class:__

    * Added `==` equality operator.

    * Added `::red`, `::green`, and `::blue` factory methods.

    * Added `#to_s` alias for `#inspect`.

    * Added `#hsv` method and `#hsb` alias.

    * Added `#hsl` method.

    * Added `#to_h` method.

    * Added `::grey` factory method and `::gray` alias.

    * RGB triplets can now either be passed as an array (as before), or as three values.
       For example, you can now do `RGB.new(0,1,0)` instead of `RGB.new([0,1,0])`.
       This applies to:
        * `::new`, `::rgb` and `::rrggbb` factory methods.
        * `#values=`, `#rgb=` and `#rrggbb=` instance methods.

 * __Optional components:__

    * Added optional support for Philips Hue lights. You can enable this with `require 'redgreenblue/opt/philipshue'`.
        * Added `#to_philips_hue_api_hsb_arguments` method.

 * __Platform specific:__

    * Mac OS only:

        * `::pick` now optionally takes a default color for the color picker.

## 0.6.0 (24 July 2019)

 * First release as a Gem.

## 0.0.0 (3 June 2019)

 * Birth of redgreenblue.
