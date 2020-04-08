# History

## Unreleased

 * __Core RGB class:__

    * Added `#hsl_hue` method.

    * Added `#hsl_saturation` method.

    * Added `#hsl_lightness` method.

    * You can now create and alter RGB colors using HSL:

        * Added `::hsl` factory method.

        * Added `#hsl=` method.

        * Added `#hsl_hue=` method.

        * Added `#hsl_saturation=` method.

        * Added `#hsl_lightness=` method.

        * Added `#hsl_rotate!` method.

        * Added `#hsl_rotate` method.

        * Added `::hsl_to_values` helper method.

    * Added `#hsv_hue` method and `#hsb_hue` alias.

    * Added `#hsv_saturation` method and `#hsb_saturation` alias.

    * Added `#hsv_value` method and `#hsb_brightness` alias.

    * You can now create and alter RGB colors using HSV and HSB:

        * Added `::hsv` factory method and `::hsb` alias.

        * Added `#hsv=` method and `#hsb=` alias.

        * Added `hsv_rotate!` method and  `hsb_rotate!` alias.

        * Added `hsv_rotate` method and `hsb_rotate` alias.

        * Added `::hsv_to_values` helper method.

    * Fixed precision of hue returned by `#hsl`, `#hsv`, and `#hsb` methods.

    * Removed `#rgb565_binary` method (deprecated in 0.9.0).

## 0.9.0 (2 March 2020)

 * __General:__

    * Tweaked documentation.

 * __Core RGB class:__

    * Added `#linear_values` and `#linear_values=` methods.

    * Added `#steps` method.

    * Added `#to_i` method.
    
    * Added `::at` factory method.

    * Added `::assemble` factory method.
    
    * Added `::yellow`, `::cyan`, and `::magenta` factory methods.
    
    * Added colorised `'short'` inspect style.

    * Added `::version` method.

    * Deprecated `#rgb565_binary` method. It will be removed in a future version.

## 0.8.0 (20 December 2019)

 * __General:__

    * Improved documentation.

 * __Core RGB class:__

    * Added the ability to choose among four inspect styles:

        * Added `::styles`, `::style`, and `::style=` methods.

        * Added `'default'` and `'hex'` inspect styles.

        * Added `'simple'` and `'swatch'` colorised inspect styles.

        * Depending on the `COLORTERM` environment variable, the initial style is `'simple'` (`COLORTERM=='truecolor'`), or `'default'`.

        Note: colorised styles require a terminal that [supports 24-bit colors](https://gist.github.com/XVilka/8346728), so-called "true color".

    * Added methods to calculate [CIE 1931](https://en.wikipedia.org/wiki/CIE_1931_color_space) XYZ and xyY coordinates:

        * Added `#cie_xyz` method and `#xyz` alias.

        * Added `#cie_xyy` method and `#xyy` alias.

        * Added `#cie_xy` method and `#xy` alias.

    * Added `#color_space` method.

    * Added `#components` method.

    * Added `#permutation` method.

    * Added `#shuffle` method.

    * Added `#css_hex` method.

    * `#whiten!`, `#whiten`, `#blacken!`, and `#blacken` now default to mixing with a 50% portion of white or black when called without an argument.

    * Added `#terminal_foreground` and `#terminal_background` methods.

    * Added `::each_24bit_color` iterator.

    * `::hex` and `#hex=` methods now raise an `ArgumentError` when fed an invalid hexadecimal string.
    
    * Added `::hex_to_rgb` method.

 * __Platform specific:__

    * Mac OS only:

        * The color picker now works correctly when you are using [iTerm2](https://www.iterm2.com/) (`::pick` and `#pick` methods no longer activate Terminal.app).

## 0.7.0 (11 November 2019)

 * __General:__

    * Improved documentation.

 * __Core RGB class:__

    * Added `==` equality operator.

    * Added `::red`, `::green`, and `::blue` factory methods.

    * Added `#to_s` method.

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
