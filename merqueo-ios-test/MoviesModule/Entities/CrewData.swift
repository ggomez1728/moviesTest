//
//  CrewData.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/10/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import Foundation
struct CrewData {
  
  /*
   
   {
   [0] = {
   key = "id"
   value = 0xb5238c8b8cf2b218 Int64(10830)
   }
   [1] = {
   key = "job"
   value = 0x0000600000afa6a0 "Executive Producer"
   }
   [2] = {
   key = "profile_path"
   value = 0x000060000111e7c0 "/mfkHPnmazcxDcjyVovNPzhUX1JN.jpg"
   }
   [3] = {
   key = "name"
   value = 0x00006000004e6e00 "Toby Emmerich"
   }
   [4] = {
   key = "department"
   value = 0x00006000004e6de0 "Production"
   }
   [5] = {
   key = "credit_id"
   value = 0x0000600000afa670 "545b5ec4c3a36853580012ad"
   }
   [6] = {
   key = "gender"
   value = 0xb5238c8b8cf016d8 Int64(2)
   }
   }
   
   */
  var id: Int?
  var job: String?
  var profile_path: String?
  var name: String?
  var department: String?
  
  
  init(routeAttributes: [String: AnyObject]) {
    if let id = routeAttributes["id"] as? Int {
      self.id = id
    }
    if let job = routeAttributes["job"] as? String {
      self.job = job
    }
    if let profile_path = routeAttributes["profile_path"] as? String {
      self.profile_path = profile_path
    }
    if let name = routeAttributes["name"] as? String {
      self.name = name
    }
    if let department = routeAttributes["department"] as? String {
      self.department = department
    }
  }
}
