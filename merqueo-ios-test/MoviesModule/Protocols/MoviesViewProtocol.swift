//
//  MoviesViewProtocol.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit

protocol MoviesViewProtocol {
  
  func viewDidLoad()
  func getAllMovies(from Page: Int)
  
}


protocol MoviePresenterProtocol {
  //Presenter -> View
  func updateTheRecentSearchList(recentSavedSearchs: [MovieData]?, error: Error?)
}


protocol MovieInteractorInputProtocol {
  var presenter: MoviesPresenter? {get set}
  //Presenter -> Interactor
  func fetchGetRecentSearches()
}


protocol MovieInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishFetchingRecentSearchResults(allMovies: [MovieData]?, error: Error?)
  func movieDetailFetched(movie: MovieData?, errorMessage: String?)
  
}

protocol MovieWireframeProtocol {
  //Presenter -> Wireframe
  func showRouteInMap(from controller: MoviesViewController, with movie: MovieData)
}


