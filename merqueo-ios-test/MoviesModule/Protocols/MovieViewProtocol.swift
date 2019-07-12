//
//  MovieViewProtocol.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/10/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit

protocol MovieViewProtocol {
  func viewDidLoad()
  func getCastBy(user id: Int)
}

protocol MovieDetailPresenterProtocol {
  //Presenter -> View
  func updateTheCurrentMovie(crew: [CrewData]?, error: Error?)
}


protocol MovieDetailInteractorInputProtocol {
  var presenter: MoviePresenter? {get set}
  //Presenter -> Interactor
  func fetchGetRecentSearches()
}


protocol MovieDetailInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishFetchingRecentSearchResults(allMovies: [CrewData]?, error: Error?)
  
}
