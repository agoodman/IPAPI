======================================

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## About IPAPI

ip-api.com offers a web service to resolve a requesting client's location
based on the client's IP address. 

## Usage

<table>
  <tr>
    <th width="30%">Here's an example</th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift"><pre>
IPAPI.location(NSURLSession.sharedSession())
    .observeOn(MainScheduler.instance)
    .subscribeNext { (geoData: IPGeoData?) in
        // do something with geoData
        // geoData.ispName => ISP Name
        // geoData.ipAddress => IP Address
        // geoData.city => City
        // geoData.region => Region
        // geoData.zipCode => Zip Code
        self.updateLocation(geoData.lat, geoData.lng)
    }
    .addDisposableTo(disposeBag)
    </pre></div></td>
  </tr>
</table>


## Requirements

* Xcode 7+
* Swift 2.3

* iOS 8.0+

## Installation

IPAPI has an external dependency on RxSwift

These are currently the supported options:


### [Carthage](https://github.com/Carthage/Carthage)

Add this to `Cartfile`

```
github "agoodman/IPAPI"
```

```
$ carthage update
```


## References

* [ip-api.com API Docs](http://ip-api.com/docs/)
* [http://reactivex.io/](http://reactivex.io/)
* [Reactive Extensions GitHub (GitHub)](https://github.com/Reactive-Extensions)
