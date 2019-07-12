//
//  merqueo_ios_testTests.swift
//  merqueo-ios-testTests
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import XCTest
@testable import merqueo_ios_test

class merqueo_ios_testTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  func testMovieAttributes() {
    let attributes: [String : Any] = ["id": 10, "overview": "content example", "original_title": "title news", "poster_path": "url_test"]
    let movie = MovieData(routeAttributes: attributes as [String : AnyObject])
    XCTAssertEqual(movie.id, 10)
    XCTAssertEqual(movie.overview, "content example")
    XCTAssertEqual(movie.original_title, "title news")
    XCTAssertEqual(movie.poster_path, "url_test")
  }
  
  func testCrewAttributes() {
    let attributes: [String : Any] = ["id": 10, "name": "content example", "job": "title job", "profile_path": "url_test"]
    let crew = CrewData(routeAttributes: attributes as [String : AnyObject])
    XCTAssertEqual(crew.id, 10)
    XCTAssertEqual(crew.name, "content example")
    XCTAssertEqual(crew.job, "title job")
    XCTAssertEqual(crew.profile_path, "url_test")
  }
  
  override func tearDown() {
    super.tearDown()
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
