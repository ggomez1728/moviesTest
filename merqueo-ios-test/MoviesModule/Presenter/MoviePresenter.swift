//
//  MoviePresenter.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/10/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//




class MoviePresenter: MovieViewProtocol{
 
  var viewRef: DetailMovieViewController?
  
  var movieDetailWireframe: MovieDetailWireFrame? //Router reference for this module.

  var movieInteractor: MovieDetailInteractor? // Interactor reference for this module.
  
  func viewDidLoad() {
    MovieDetailWireFrame.loadMoviePageComponents(withPresenter: self)  //Load all the components for this module
  }
  
  func getCastBy(user id: Int) {
    movieInteractor?.getCastFor(movie: id)
  }
  
}

extension MoviePresenter: MovieDetailInteractorOutputProtocol{
  func didFinishFetchingRecentSearchResults(allMovies: [CrewData]?, error: Error?) {
    guard let crewsResults = allMovies else {
      return
    }
    viewRef?.updateTheCurrentMovie(crew: crewsResults, error: nil)
  }
  

  
  
}

