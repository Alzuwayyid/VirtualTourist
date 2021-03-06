# VirtualTourist

VirtualTourist is the final project for iOS Developer Nanodegree Program in Udacity.

[![Swift Version](https://img.shields.io/badge/Swift-4.2-success.svg)](https://swift.org)
[![Xcode Version](https://img.shields.io/badge/Xcode-10.1-success.svg)](https://swift.org)
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](https://swift.org)


## Project overview
The Virtual Tourist app downloads and stores images from Flickr. The app allows users to drop pins on a map, as if they were stops on a tour. Users will then be able to download pictures for the location and persist both the pictures, and the association of the pictures with the pin.

![alt tag](https://i.ibb.co/CJy83S0/1-3.png)

![alt tag](https://i.ibb.co/BNpd77s/2.png)

## Build
### Requirements
* Xcode 10+
* iOS 12+
* Swift 4.2+


### Steps to build
1. Clone repo 
```
git clone https://github.com/Alzuwayyid/VirtualTourist.git
```

2. Install dependences (**CocoaPods needed**)
```
pod install
```

3. Insert flicker API key & secret inside -> (Virtual\ Tourist/API/FlickrAPI.swift) *left my key & secret for ease of building*
```swift
class FlickrAPI {
    struct Constants {
        static let API_KEY = // Here
        static let API_SECRET = // Here
        static let BASE_URL = "https://api.flickr.com/services/rest"
        static let FLICKR_SEARCH_METHOD = "flickr.photos.search"
        static let ACCURACY = 11
        static let NUM_OF_PHOTOS = 20
    }
    ....
```

4. Open `Virtual Tourist.xcworkspace`
5. Build app for your device or simulator

## How to use the app
- [x] Lunch the app using the simulator.
- [x] A map will be shown and you can place a pin by pressing on the map
- [x] By pressing a map, you will see all Flicker photos that were taken in the place.
- [x] You may delete any photo you want.
- [x] If you want a new set of images, you can press on "New collection" button.


### Third-party frameworks

| Framework | Description |
| --- | --- 
| [CocoaPods](https://github.com/CocoaPods/CocoaPods) | The Cocoa Dependency Manager. |
| [Alamofire](https://github.com/Alamofire/Alamofire) | Easy HTTP networking in Swift. |
| [Kingfisher](https://github.com/onevcat/Kingfisher) | A lightweight, pure-Swift library for downloading and caching images from the web.|

### APIs
| Framework | Description |
| --- | --- |
| [Flickr API](https://www.flickr.com/services/api/) | It is used to retrieve photos related to the locations. |
