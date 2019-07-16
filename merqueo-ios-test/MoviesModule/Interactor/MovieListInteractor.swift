//
//  MovieListInspector.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit
import CoreData

class MovieListInteractor: MovieInteractorInputProtocol{

  
  var presenter: MoviesPresenter?
  
  
  func fetchGetRecentSearches() {
    let managedObjectContext = CDManager.sharedDatabaseManager.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
    do {
      let savedSearchRsults = try managedObjectContext.fetch(fetchRequest) as! [Movie]
      let movies = savedSearchRsults.compactMap({convert($0)})
      presenter?.didFinishFetchingRecentSearchResults(allSearches: movies, error: nil)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
      presenter?.didFinishFetchingRecentSearchResults(allSearches: nil, error: error)
    }
    
  }
  
  func convert(_ movie:Movie)->MovieData{
    let movieData = MovieData(routeAttributes: ["id": movie.id as AnyObject, "original_title": movie.original_title as AnyObject, "poster_path": movie.poster_path as AnyObject ])
    return movieData
  }
  
  func saveInList(_ movie: MovieData) {
    let managedObjectContext = CDManager.sharedDatabaseManager.persistentContainer.viewContext
    guard let id = movie.id, let overview  = movie.overview, let original_title  = movie.original_title, let title  = movie.title, let poster_path  = movie.poster_path else {
      return
    }
    let entity = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: managedObjectContext) as! Movie
    entity.id = Int64(id)
    entity.overview = overview
    entity.original_title = original_title
     entity.title = title
     entity.poster_path = poster_path
    CDManager.sharedDatabaseManager.saveContext()
    
  }
  
  //Get movie from one location to another as provided by the user
  func getAllMovies(from page: Int) {
    
    let movieDirectionsURL = WebServiceAPIPaths.theMovieDbDirectionsAPIPath + "/3/movie/popular?api_key=\(TheMovieDbAPIConstants.key)&language=en-US&page=\(page)"
    
    WebServiceManager.sharedService.requestAPI(url: movieDirectionsURL, parameter: nil, httpMethodType: .GET) { (response, error) in
      DispatchQueue.main.async {
        guard let data = response else {
          self.fetchGetRecentSearches()
          return
        }
        let resultsList = data["results"] as! [[String: AnyObject]]
        var movies = [MovieData]()
        if resultsList.count > 0 {
          resultsList.forEach({ (movie) in
            let movieData = MovieData(routeAttributes: movie)
            self.saveInList(movieData)
            movies.append(movieData)
          })
          self.presenter?.didFinishFetchingRecentSearchResults(allMovies: movies, error: nil)
        } else {
          self.presenter?.movieDetailFetched(movie: nil, errorMessage: "No movie found")
        }
      }
    }
  }
  
  func getMovies(for Query: String, page: Int){
     let movieDirectionsURL = "\(WebServiceAPIPaths.theMovieDbDirectionsAPIPath)/3/search/movie?api_key=\(TheMovieDbAPIConstants.key)&language=en-US&query=\(Query)&page=\(page)&include_adult=false"
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
          self.presenter?.didFinishFetchingRecentSearchResults(allMovies: [], error: nil)
        
        }
      }
    }
  }

  //"https://image.tmdb.org/t/p/w1280/"
  
}

