//
//  MovieModel.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import Foundation
struct MovieData {
  var id: Int?
  var vote_count: Int?
  var video: Bool?
  var vote_average: Double?
  var title: String?
  var popularity: Double?
  var poster_path: String?
  var original_language: String?
  var original_title: String?
  var adult: Bool?
  var overview: String?
  var release_date: String?
  
  init(routeAttributes: [String: AnyObject]) {
    if let id = routeAttributes["id"] as? Int {
      self.id = id
    }
    if let vote_count = routeAttributes["vote_count"] as? Int {
      self.vote_count = vote_count
    }
    if let video = routeAttributes["video"] as? Bool {
      self.video = video
    }
    if let vote_average = routeAttributes["vote_average"] as? Double {
      self.vote_average = vote_average
    }
    if let title = routeAttributes["title"] as? String {
      self.title = title
    }
    if let popularity = routeAttributes["popularity"] as? Double {
      self.popularity = popularity
    }
    if let poster_path = routeAttributes["poster_path"] as? String {
      self.poster_path = poster_path
    }
    if let original_language = routeAttributes["original_language"] as? String {
      self.original_language = original_language
    }
    if let original_title = routeAttributes["original_title"] as? String {
      self.original_title = original_title
    }
    if let adult = routeAttributes["adult"] as? Bool {
      self.adult = adult
    }
    if let overview = routeAttributes["overview"] as? String {
      self.overview = overview
    }
    if let release_date = routeAttributes["release_date"] as? String {
      self.release_date = release_date
    }
  }
}
