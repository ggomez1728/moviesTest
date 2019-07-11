//
//  MovieWireFrame.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit

class MovieWireFrame{
  
  func navigateToDetailPage(show movie: MovieData, from classRef: UIViewController){
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    let detailMovieController = mainStoryBoard.instantiateViewController(withIdentifier: "DetailMovieViewController") as! DetailMovieViewController
    detailMovieController.movie = movie
    guard let sourceNavigationController = classRef.navigationController else {
      classRef.present(detailMovieController, animated: true, completion: nil)
      return
    }
    sourceNavigationController.pushViewController(detailMovieController, animated: true)
  }
  
  class func loadMoviesListPageComponents(withPresenter presenter: MoviesPresenter) {
    presenter.movieWireframe = MovieWireFrame()
    presenter.movieInteractor  = MovieListInteractor()
    presenter.movieInteractor?.presenter = presenter
  }
}
