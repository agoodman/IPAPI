//
//  IPGeoData.swift
//  IPAPI
//
//  Created by Aubrey Goodman on 9/29/16.
//  Copyright © 2016 Aubrey Goodman. All rights reserved.
//

import Foundation

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
