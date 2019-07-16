//
//  MoviesPresenter.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit
 
class MoviesPresenter: MoviesViewProtocol {
  
  var viewRef: MoviesViewController?//View reference of the main screen of this module i.e SearchController
  var movieWireframe: MovieWireFrame? //Router reference for this module.
  var movieInteractor: MovieListInteractor? // Interactor reference for this module.
  
  func viewDidLoad() {
    MovieWireFrame.loadMoviesListPageComponents(withPresenter: self) //Load all the components for this module
    getAllMovies(from: 1)
    movieInteractor?.fetchGetRecentSearches() //Ask the interactor to update fetch the recent searches made by user.

  }
  
  func getAllMovies(from Page: Int) {
    movieInteractor?.getAllMovies(from: Page)
  }
  
  func getMovies(for Query: String, page: Int) {
    movieInteractor?.getMovies(for: Query, page: page)
  }
  
  
}




extension MoviesPresenter: MovieInteractorOutputProtocol{
  func didFinishFetchingRecentSearchResults(allMovies: [MovieData]?, error: Error?) {

    guard let moviesResults = allMovies else {
      return
    }
    viewRef?.updateTheRecentSearchList(recentSavedSearchs: moviesResults, error: nil)
  }
  
  
  func movieDetailFetched(movie: MovieData?, errorMessage: String?) {
    if let movie = movie{
       movieWireframe?.navigateToDetailPage(show: movie, from: viewRef!)
    }
  }
  
  func didFinishFetchingRecentSearchResults(allSearches: [MovieData]?, error: Error?) {
    guard let searchResults = allSearches else {
      return
    }
    
    viewRef?.updateTheRecentSearchList(recentSavedSearchs: searchResults,error: nil) //Ask the view to update the recent search list
  }
  
}


