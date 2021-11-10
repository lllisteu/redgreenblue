[← README](README.md) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions)

# History

## 0.15.0 (10 November 2021)

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.15.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.15.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.15.0/RGB)

 * __Core RGB class:__

    * CIE 1994 processing:

        * Added `#delta_e_cie_1994` method and `#de94` alias.

        * Added `#de94g` and `#de94t` shortcut methods.

    * Color matching methods:

        * Added `#match_de94` method.

        * Added `#match_de94g` and `#match_de94t` shortcut methods.

    * `#view` accepts an RGB object as an optional argument, for visual comparison of colors.

    * Added `#web_safe?` method.

## 0.14.0 (3 May 2021)

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.14.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.14.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.14.0/RGB)

 * __Core RGB class:__

    * Added `#css_names` method.

    * Added `#hwb` method.

    * Support for working with [Web Content Accessibility Guidelines 2.0](https://www.w3.org/TR/WCAG20/):

        * Added `#wcag20_luminance` method.

        * Added `#wcag20_contrast_ratio` method.

    * Added `::gpl_header` method.

    * The `#ostwald_cwk` method now rounds results to a precision of 8 decimal places. This fixes rare inaccuracies.

## 0.13.0 (9 November 2020)

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.13.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.13.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.13.0/RGB)

 * __General:__

    * Minor code optimisations.

 * __Core RGB class:__

    * Color matching methods:

        * Added `#match_de76` method.

        * Added `#match_distance` method.

    * Added `::corners` method.

    * Added `::centre` method and `::center` alias.

    * Added `#applescript` method.

## 0.12.0 (8 September 2020)

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.12.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.12.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.12.0/RGB)

 * __Core RGB class:__

    * Added `#view` method, `#v` alias, and `'view'` inspect style.

    * CIE 1976 processing:

        * Added `#cie_lab` method and `#lab` alias.

        * Added `#cie_lch_ab` method.

        * Added `#cie_luv` method and `#luv` alias.

        * Added `#cie_lch_uv` method.

        * Added `#delta_e_cie_1976` method and `#de76` alias.

    * Added `#distance` method.

    * RGB colors can now have a `name` attribute:

        * Added `#name` and `#name=` methods.

        * Added colorised `'name'` inspect style.

        * `'default'` and `'simple'` inspect styles include name.

        * `#gpl` method picks up name attribute.

    * Added 148 named [CSS colors](https://drafts.csswg.org/css-color/#named-colors), accessible by color or by name:

        * Added `::css` method.

    * Added ability to create color objects from GIMP [.gpl palettes](https://docs.gimp.org/2.10/en/gimp-concepts-palettes.html):

        * Added `::gpl` method.

        * Added `::load_gpl` method.

    * `#inspect` now prefixes hexadecimal notation with `~` (tilde) when the exact color can not be represented within 24-bits, and hexadecimal notation represents the nearest 24-bit color instead.

    * Improved `#cie_xyz` and `#cie_xyy` methods to produce results with a precision of 8 decimal places (formerly 6).

    * Fixed a bug where calling `#color_space`, `#linear_values`, or any of the `#cie` methods on a frozen RGB object might raise an exception.

## 0.11.0 (23 June 2020)

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.11.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.11.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.11.0/RGB)

 * __General:__

    * Polished documentation.

 * __Core RGB class:__

    * Added `#ostwald_color` method.

    * Added `#ostwald_cwk` method and `#cwk` alias.

    * Added `#achromatic?` method.

    * Added `#gpl` method.

    * Added `#snap!` and `#snap` methods.

    * `#whiten` and `#blacken` now accept more than one argument, e.g. `RGB.red.whiten(0.2, 0.5, 0.8)` will return three RGB objects.

    * If a `REDGREENBLUE_STYLE` environment variable is set, redgreenblue will use it to set the inspect style.

## 0.10.0 (16 April 2020)

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.10.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.10.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.10.0/RGB)

 * __Core RGB class:__

    * Added `#hsl_h`, `#hsl_s`, and `#hsl_l` methods.

    * You can now create and alter RGB colors using HSL:

        * Added `::hsl` factory method.

        * Added `#hsl=` method.

        * Added `#hsl_h=`, `#hsl_s=`, and `#hsl_l=` methods.

        * Added `#hsl_rotate!` method.

        * Added `#hsl_rotate` method.

        * Added `::hsl_to_values` helper method.

    * Added `#hsv_h`, `#hsv_s`, and `#hsv_v` methods,
        and `#hsb_h`, `#hsb_s`, and `#hsb_b` aliases.

    * You can now create and alter RGB colors using HSV and HSB:

        * Added `::hsv` factory method and `::hsb` alias.

        * Added `#hsv=` method and `#hsb=` alias.

        * Added `#hsv_h=`, `#hsv_s=`, and `#hsv_v=` methods,
            and `#hsb_h=`, `#hsb_s=`, and `#hsb_b=` aliases.

        * Added `hsv_rotate!` method and  `hsb_rotate!` alias.

        * Added `hsv_rotate` method and `hsb_rotate` alias.

        * Added `::hsv_to_values` helper method.

    * Fixed precision of hue returned by `#hsl`, `#hsv`, and `#hsb` methods.

    * Removed `#rgb565_binary` method (deprecated in 0.9.0).

## 0.9.0 (2 March 2020)

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.9.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.9.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.9.0/RGB)

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

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.8.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.8.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.8.0/RGB)

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

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.7.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.7.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.7.0/RGB)

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

[GitHub](https://github.com/lllisteu/redgreenblue/releases/tag/v0.6.0) • [RubyGems](https://rubygems.org/gems/redgreenblue/versions/0.6.0) • [Documentation](https://www.rubydoc.info/gems/redgreenblue/0.6.0/RGB)

 * First release as a Gem.

## 0.0.0 (3 June 2019)

 * Birth of redgreenblue.
