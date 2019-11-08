[GitHub](https://github.com/lllisteu/redgreenblue) • [RubyGems](https://rubygems.org/gems/redgreenblue) • [History](History.md)

# redgreenblue

redgreenblue is a simple [Ruby](https://www.ruby-lang.org/) library for handling [RGB colors](https://en.wikipedia.org/wiki/RGB_color_model).

It lets you express RGB colors as 24-bit triplets, 48-bit triplets, fractions, or hexadecimal notation.

It also understands some more exotic formats, such as 16-bit RGB565 (used by some led-panels such as the Raspberry Pi Sense Hat) and 24-bit BGR (used in BMP files). It can create 1-pixel GIF's from any color, and on a Mac it can interact with the system color picker.

## Quick start

The core of redgreenblue is the __RGB class__. Each instance of the RGB class holds a color. Internally, these instances, RGB objects, store the amounts of red, green and blue which make up the color.

Let's try:

```
require 'redgreenblue'
=> true
pink = RGB.hex('ff99cc')
=> RGB #ff99cc (red=1.00000 green=0.60000 blue=0.80000)
```

Now that we have a color stored in an RGB object, it can supply several pieces of information about itself:

```
pink.values
=> [1.0, 0.6, 0.8]
pink.red
=> 1.0
pink.rgb
=> [255, 153, 204]
pink.g
=> 153
pink.rrggbb
=> [65535, 39321, 52428]
pink.bb
=> 52428
pink.hsb
=> [330.0, 0.4, 1.0]
pink.hsl
=> [330.0, 1.0, 0.8]
pink.hex
=> "ff99cc"
pink.hex(true)
=> "f9c"
```

In case you are wondering: HSB means hue, saturation and brightness. HSL means hue, saturation and lightness.

There are many ways to create RGB objects:

```
pink = RGB.new(1, 0.6, 0.8)
=> RGB #ff99cc (red=1.00000 green=0.60000 blue=0.80000)
pink = RGB.rgb(255, 153, 204)
=> RGB #ff99cc (red=1.00000 green=0.60000 blue=0.80000)
pink = RGB.rrggbb(65535, 39321, 52428)
=> RGB #ff99cc (red=1.00000 green=0.60000 blue=0.80000)
pink = RGB.hex('f9c')
=> RGB #ff99cc (red=1.00000 green=0.60000 blue=0.80000)
```

...and to alter them:

```
rose = RGB.red
=> RGB #ff0000 (red=1.00000 green=0.00000 blue=0.00000)
rose.g = 153
=> 153
rose.bb = 52428
=> 52428
rose
=> RGB #ff99cc (red=1.00000 green=0.60000 blue=0.80000)
pink == rose
=> true
```

## Resources

* [HSL and HSV](https://en.wikipedia.org/wiki/HSL_and_HSV) on Wikipedia
* [HSB explained](https://geraldbakker.nl/psnumbers/hsb-explained.html) by Gerald Bakker
* [Bruce Lindbloom](http://www.brucelindbloom.com/)
* [_A Guided Tour of Color Space_](http://poynton.ca/PDFs/Guided_tour.pdf) (PDF), by [Charles Poynton](http://poynton.ca/) (1997)
* _Color Ordered_, by Rolf Kuehni and Andreas Schwarz (2008), ISBN 978-0-19-518968-1
* _Psychology_, by Henry Gleitman, James Gross, Daniel Reisberg (2010), ISBN 978-0-393-93250-8

## Credits

Apart from the resources listed above, some discussions and answers on [Stack Overflow](https://stackoverflow.com) and [PerlMonks](https://www.perlmonks.org) were very helpful, as were some articles on [Wikipedia](https://en.wikipedia.org/). These are credited where applicable in the source code, often with a link.

## License

See the included LICENSE file.

## Alternatives

[Color](https://github.com/halostatue/color): a versatile Ruby color library.
