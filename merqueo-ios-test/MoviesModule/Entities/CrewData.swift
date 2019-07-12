//
//  CrewData.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/10/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import Foundation
struct CrewData {
  
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
