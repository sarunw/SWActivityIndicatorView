# SWActivityIndicatorView

A simple flat activity indicator view.

![alt tag](https://raw.githubusercontent.com/sarunw/SWActivityIndicatorView/master/Documentations/demo.gif)

## Installation

SWActivityIndicatorView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SWActivityIndicatorView"
```

You may also quickly try the SWActivityIndicatorView example project with

```ruby
pod try SWActivityIndicatorView
```

## Requirements

Requires iOS 8.0+ and ARC.

## Usage

Basic usage
```swift
let activityIndicatorView = SWActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
self.view.addSubview(activityIndicatorView)
activityIndicatorView.startAnimating()
```

If you use Interface Builder, add a UIView to your interface and set Class to `SWActivityIndicatorView`.

### Customization
You can use customize SWActivityIndicatorView via property
```swift
activityIndicatorView.lineWidth = 2
activityIndicatorView.autoStartAnimating = true
activityIndicatorView.hidesWhenStopped = false
activityIndicatorView.color = UIColor.lightGrayColor()
```

## Author

[Sarun Wongpatcharapakorn](https://github.com/sarunw) ([@sarunw](https://twitter.com/sarunw))

## License

SWActivityIndicatorView is available under the MIT license. See the LICENSE file for more info.
