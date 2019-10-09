[GitHub](https://github.com/lllisteu/redgreenblue) • [RubyGems](https://rubygems.org/gems/redgreenblue)

# redgreenblue

redgreenblue is a simple [Ruby](https://www.ruby-lang.org/) library for handling [RGB colors](https://en.wikipedia.org/wiki/RGB_color_model).

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

## Resources

* [HSL and HSV](https://en.wikipedia.org/wiki/HSL_and_HSV) on Wikipedia
* [HSB explained](https://geraldbakker.nl/psnumbers/hsb-explained.html) by Gerald Bakker
* [_A Guided Tour of Color Space_](http://poynton.ca/PDFs/Guided_tour.pdf) (PDF), by [Charles Poynton](http://poynton.ca/) (1997)
* _Color Ordered_, by Rolf Kuehni and Andreas Schwarz (2008), ISBN 978-0-19-518968-1
* _Psychology_, by Henry Gleitman, James Gross, Daniel Reisberg (2010), ISBN 978-0-393-93250-8

## License

See the included LICENSE file.

## Alternatives

[Color](https://github.com/halostatue/color): a versatile Ruby color library.
