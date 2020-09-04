# VirtualTourist
An app that downloads and stores images from Flickr. The app will allow users to drop pins on a map, as if they were stops on a tour. Users will then be able to download pictures for the location and persist both the pictures, and the association of the pictures with the pin.

## Project overview
The Virtual Tourist app downloads and stores images from Flickr. The app allows users to drop pins on a map, as if they were stops on a tour. Users will then be able to download pictures for the location and persist both the pictures, and the association of the pictures with the pin.

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
1- Lunch the app using the simulator.
2- A map will be shown and you can place a pin by pressing on the map
3- By pressing a map, you will see all Flicker photos that were taken in the place.
4- You may delete any photo you want.
5- If you want a new set of images, you can press on "New collection" button.


### Third-party frameworks

| Framework | Description |
| --- | --- 
| [CocoaPods](https://github.com/CocoaPods/CocoaPods) | The Cocoa Dependency Manager. |
| [Alamofire](https://github.com/Alamofire/Alamofire) | Easy HTTP networking in Swift. |
| [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) | The better way to deal with JSON data in Swift.|
| [Kingfisher](https://github.com/onevcat/Kingfisher) | A lightweight, pure-Swift library for downloading and caching images from the web.|

### APIs
| Framework | Description |
| --- | --- |
| [Flickr API](https://www.flickr.com/services/api/) | It is used to retrieve photos related to the locations. |
