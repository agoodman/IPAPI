//
//  IPGeoData.swift
//  IPAPI
//
//  Created by Aubrey Goodman on 9/29/16.
//  Copyright © 2016 Aubrey Goodman. All rights reserved.
//

import Foundation

open class IPGeoData {
  open let status : String?
  open let country : String?
  open let countryCode : String?
  open let region : String?
  open let regionName : String?
  open let city : String?
  open let zipCode : String?
  open let lat : Double
  open let lng : Double
  open let timeZone : String?
  open let ispName : String?
  open let orgName : String?
  open let ipAddress : String?
  
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
