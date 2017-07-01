//
//  IPAPI.swift
//  IPAPI
//
//  Client for ip-api.com, which returns annotated geospatial data
//  based on the requesting client's IP address
//
//  Created by Aubrey Goodman on 9/28/16.
//  Copyright © 2016 Aubrey Goodman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


open class IPAPI {

  fileprivate static let endpointUrl = "http://ip-api.com/json"
  
  open class func location(_ session: URLSession) -> Observable<IPGeoData?> {
    let url = URL(string: endpointUrl)!
    return session.rx
      .json(url: url)
      .observeOn(MainScheduler.asyncInstance)
      .map { (data) -> IPGeoData? in

        // rx_JSON returns AnyObject, but it's actually a NSDictionary
        guard let rawJson: Dictionary<String,Any> = data as? Dictionary else { return nil }

        // graceful guard against bad cast
        guard let statusString: String = rawJson["status"] as? String else { return nil }

        // we are not propagating the error message, just returning nil on fail
        let lowercaseStatus = statusString.lowercased()
        if lowercaseStatus == "success" {
          return extractGeoData(rawJson)
        }
        
        return nil
      }
  }
  
  fileprivate class func extractGeoData(_ jsonData: Dictionary<String,Any>) -> IPGeoData? {
    guard
      let status = jsonData["status"] as? String,
      let country = jsonData["country"] as? String,
      let countryCode = jsonData["countryCode"] as? String,
      let region = jsonData["region"] as? String,
      let regionName = jsonData["regionName"] as? String,
      let city = jsonData["city"] as? String,
      let zipCode = jsonData["zip"] as? String,
      let lat = jsonData["lat"] as? NSNumber,
      let lng = jsonData["lon"] as? NSNumber,
      let timeZone = jsonData["timeZone"] as? String,
      let ispName = jsonData["isp"] as? String,
      let orgName = jsonData["org"] as? String,
      let ipAddress = jsonData["query"] as? String
      else { return nil }
    
    return IPGeoData(status: status,
                     country: country,
                     countryCode: countryCode,
                     region: region,
                     regionName: regionName,
                     city: city,
                     zipCode: zipCode,
                     lat: lat.doubleValue,
                     lng: lng.doubleValue, 
                     timeZone: timeZone, 
                     ispName: ispName, 
                     orgName: orgName, 
                     ipAddress: ipAddress)
  }
  
}
