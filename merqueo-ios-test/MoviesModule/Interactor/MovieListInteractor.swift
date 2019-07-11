//
//  MovieListInspector.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit

class MovieListInteractor: MovieInteractorInputProtocol{

  
  var presenter: MoviesPresenter?
  
  
  //Get movie from one location to another as provided by the user
  func getAllMovies(from page: Int) {
    
    let movieDirectionsURL = WebServiceAPIPaths.theMovieDbDirectionsAPIPath + "/3/movie/popular?api_key=\(TheMovieDbAPIConstants.key)&language=en-US&page=\(page)"
    
    WebServiceManager.sharedService.requestAPI(url: movieDirectionsURL, parameter: nil, httpMethodType: .GET) { (response, error) in
      DispatchQueue.main.async {
        guard let data = response else {
          self.presenter?.movieDetailFetched(movie: nil, errorMessage: error?.localizedDescription)
          return
        }
        let resultsList = data["results"] as! [[String: AnyObject]]
        var movies = [MovieData]()
        if resultsList.count > 0 {
          resultsList.forEach({ (movie) in
            let movieData = MovieData(routeAttributes: movie)
            movies.append(movieData)
          })
          self.presenter?.didFinishFetchingRecentSearchResults(allMovies: movies, error: nil)
         
          
        } else {
          self.presenter?.movieDetailFetched(movie: nil, errorMessage: "No movie found")
        }
        
      }
    }
    
  }

  func fetchGetRecentSearches() {
    
  }
  //"https://image.tmdb.org/t/p/w1280/"
  
}

