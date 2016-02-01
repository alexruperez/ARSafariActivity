# ARSafariActivity

[![Twitter](http://img.shields.io/badge/contact-@alexruperez-blue.svg?style=flat)](http://twitter.com/alexruperez)
[![Version](https://img.shields.io/cocoapods/v/ARSafariActivity.svg?style=flat)](http://cocoadocs.org/docsets/ARSafariActivity)
[![License](https://img.shields.io/cocoapods/l/ARSafariActivity.svg?style=flat)](http://cocoadocs.org/docsets/ARSafariActivity)
[![Platform](https://img.shields.io/cocoapods/p/ARSafariActivity.svg?style=flat)](http://cocoadocs.org/docsets/ARSafariActivity)
[![Analytics](https://ga-beacon.appspot.com/UA-55329295-1/ARSafariActivity/readme?pixel)](https://github.com/igrigorik/ga-beacon)

## Overview

`ARSafariActivity` is a `UIActivity` subclass that provides an "Open in Safari" action to a `UIActivityViewController`.

![ARSafariActivity screenshot](https://raw.github.com/alexruperez/ARSafariActivity/master/screenshot.png "ARSafariActivity screenshot")

## Requirements

- As `UIActivity` is iOS >= 6 only, so is the subclass.
- This project uses ARC. If you want to use it in a non ARC project, you must add the `-fobjc-arc` compiler flag to ARSafariActivity.m in Target Settings > Build Phases > Compile Sources.

## Installation

Add the `ARSafariActivity` subfolder to your project. There are no required libraries other than `UIKit`.

## Usage

*(See example Xcode project)*

Simply `alloc`/`init` an instance of `ARSafariActivity` and pass that object into the applicationActivities array when creating a `UIActivityViewController`.

```objectivec
NSURL *url = [NSURL URLWithString:@"http://alexruperez.com"];
ARSafariActivity *safariActivity = [[ARSafariActivity alloc] init];
UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:@[safariActivity]];
[self presentViewController:activityViewController animated:YES completion:nil];
```

Note that you can include the activity in any UIActivityViewController and it will only be shown to the user if there is a URL in the activity items.

## Thanks

podspec file added by @aaronbrethorst
bundle added by @raymondjavaxx
iOS6 icon from http://iconfinder.com and added by @banaslee
