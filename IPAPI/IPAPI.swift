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


class IPAPI {

  private static let endpointUrl = "http://ip-api.com/json"
  
  class func location(session: NSURLSession) -> Observable<IPGeoData?> {
    let url = NSURL(string: endpointUrl)!
    return session
      .rx_JSON(url)
      .observeOn(MainScheduler.asyncInstance)
      .map { (data) -> IPGeoData? in

        // rx_JSON returns AnyObject, but it's actually a NSDictionary
        let rawJson = data as! NSDictionary
        
        let statusString = rawJson["status"]

        // we are not propagating the error message, just returning nil on fail
        if let lowercaseStatus = statusString?.lowercaseString {
          if lowercaseStatus == "success" {
            let geoData = extractGeoData(rawJson)
            return geoData
          }
        }
        
        return nil
      }
  }
  
  private class func extractGeoData(jsonData: NSDictionary) -> IPGeoData {
    let status = jsonData["status"] as! String?
    let country = jsonData["country"] as! String?
    let countryCode = jsonData["countryCode"] as! String?
    let region = jsonData["region"] as! String?
    let regionName = jsonData["regionName"] as! String?
    let city = jsonData["city"] as! String?
    let zipCode = jsonData["zip"] as! String?
    let lat = jsonData["lat"] as! NSNumber
    let lng = jsonData["lon"] as! NSNumber
    let timeZone = jsonData["timeZone"] as! String?
    let ispName = jsonData["isp"] as! String?
    let orgName = jsonData["org"] as! String?
    let ipAddress = jsonData["query"] as! String?
    
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

public struct IPGeoData {
  let status : String?
  let country : String?
  let countryCode : String?
  let region : String?
  let regionName : String?
  let city : String?
  let zipCode : String?
  let lat : Double
  let lng : Double
  let timeZone : String?
  let ispName : String?
  let orgName : String?
  let ipAddress : String?
  
  init(status: String?,
       country : String?,
       countryCode : String?,
       region : String?,
       regionName : String?,
       city : String?,
       zipCode : String?,
       lat : Double,
       lng : Double,
       timeZone : String?,
       ispName : String?,
       orgName : String?,
       ipAddress : String?) {
    self.status = status
    self.country = country
    self.countryCode = countryCode
    self.region = region
    self.regionName = regionName
    self.city = city
    self.zipCode = zipCode
    self.lat = lat
    self.lng = lng
    self.timeZone = timeZone
    self.ispName = ispName
    self.orgName = orgName
    self.ipAddress = ipAddress
  }
  
}
