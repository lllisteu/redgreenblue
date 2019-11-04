# History

## Changes

 * Added `==` equality operator.
 
 * Added `::red`, `::green`, and `::blue` factory methods.

 * Added `#to_s` alias for `#inspect`.
 
 * Added optional support for Philips Hue lights. You can enable this with `require 'redgreenblue/opt/philipshue'`.
    * Added `#to_philips_hue_api_hsb_arguments` method.
 
 * Added `#hsv` method and `#hsb` alias.
 
 * Added `#hsl` method.

 * Added `#to_h` method.
 
 * Added `::grey` factory method and `::gray` alias.
 
 * RGB triplets can now either be passed as an array (as before), or as three values.
   For example, you can now do `RGB.new(0,1,0)` instead of `RGB.new([0,1,0])`.
   This applies to:
    * `::new`, `::rgb` and `::rrggbb` factory methods.
    * `#values=`, `#rgb=` and `#rrggbb=` instance methods.
 
## 0.6.0 (24 July 2019)

 * First release as a Gem.

## 0.0.0 (3 June 2019)

 * Birth of redgreenblue.