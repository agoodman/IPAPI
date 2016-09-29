//
//  IPGeoData.swift
//  IPAPI
//
//  Created by Aubrey Goodman on 9/29/16.
//  Copyright © 2016 Aubrey Goodman. All rights reserved.
//

import Foundation

public class IPGeoData {
  public let status : String?
  public let country : String?
  public let countryCode : String?
  public let region : String?
  public let regionName : String?
  public let city : String?
  public let zipCode : String?
  public let lat : Double
  public let lng : Double
  public let timeZone : String?
  public let ispName : String?
  public let orgName : String?
  public let ipAddress : String?
  
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
