//
//  MovieDetailInteractor.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/10/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorInputProtocol{
  
  var presenter: MoviePresenter?
  
  func getCastFor(movie id:Int){
    let movieDirectionsURL = "\(WebServiceAPIPaths.theMovieDbDirectionsAPIPath)/3/movie/\(id)/credits?api_key=\(TheMovieDbAPIConstants.key)"
    
    WebServiceManager.sharedService.requestAPI(url: movieDirectionsURL, parameter: nil, httpMethodType: .GET) { (response, error) in
      DispatchQueue.main.async {
        guard let data = response else {
          //self.presenter?.movieDetailFetched(movie: nil, errorMessage: error?.localizedDescription)
          return
        }
        
        let resultsList = data["crew"] as! [[String: AnyObject]]
        var crews = [CrewData]()
        if resultsList.count > 0 {
          resultsList.forEach({ (movie) in
            let crewData = CrewData(routeAttributes: movie)
            crews.append(crewData)
          })
          self.presenter?.didFinishFetchingRecentSearchResults(allMovies: crews, error: nil)
          
          
        } else {
          //self.presenter?.movieDetailFetched(movie: nil, errorMessage: "No movie found")
        }
        
      }
    }
  }
  
  func fetchGetRecentSearches() {
    
  }
  
  
}
