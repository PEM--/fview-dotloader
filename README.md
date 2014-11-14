# DotLoader - Animated dot loader
A plugin for [famous-views](http://famous-views.meteor.com).

This plugin brings animated dot loader in Blaze or Jade templating for [Meteor.js](https://www.meteor.com).

This loader for [famo.us](http://famo.us) is inspired from the work of [LeXXiK](https://github.com/LeXXik) and [Tony Alves](https://github.com/talves) in [Famousco.de](http://famousco.de/2014/07/animated-dots-icon/).

## Usage
```bash
meteor add pierreeric:famous-dotloader
```

Template in Jade (Blaze works fine too :wink:):
```jade
+StateModifier align='[.5, .5]' origin='[.5, .5]' size='[75, 75]'
  +DotLoader
    |
```

Available attributes and their defaults are:
* `height`: 75
* `dotsNumber`: 7
* `dotD`: 10
* `delay`: 150
* `isBgVisible`: true
* `bgClass`: `'dotloader-background'`
* `dotClass`: `'dotloader-dots'`

And add the CSS:
```css
.dotloader-background' {
  background-color: green;
  border-radius: 5px;
}
.dotloader-dots {
  background-color: yellow;
}
```
