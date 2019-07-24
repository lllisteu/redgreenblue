# redgreenblue

[![Gem Version](https://badge.fury.io/rb/redgreenblue.svg)](https://rubygems.org/gems/redgreenblue)

redgreenblue is a simple [Ruby](https://www.ruby-lang.org/) library for handling RGB colors.

It lets you express RGB colors as 24-bit triplets, 48-bit triplets, fractions, or hexadecimal notation.

It also understands some more exotic formats, such as 16-bit RGB565 (used by some led-panels such as the Raspberry Pi Sense Hat) and 24-bit BGR (used in BMP files). It can create 1-pixel GIF's from any color, and on a Mac it can interact with the system color picker.

## Synopsis

```
color = RGB.hex('0f8')
=> RGB #00ff88 (red=0.00000 green=1.00000 blue=0.53333)
color.g
=> 255
color.bb
=> 34952
color.red = 0.1
=> 0.1
color
=> RGB #1aff88 (red=0.10000 green=1.00000 blue=0.53333)
color.rgb
=> [26, 255, 136]
color.blacken! 0.2
=> RGB #14cc6d (red=0.08000 green=0.80000 blue=0.42667)
```

## License

See the included LICENSE file.

## Alternatives

[Color](https://github.com/halostatue/color): a versatile Ruby color library.
