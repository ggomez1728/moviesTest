//
//  MovieDetailWireFrame.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/10/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit

class MovieDetailWireFrame {
  
  class func loadMoviePageComponents(withPresenter presenter: MoviePresenter) {
    presenter.movieDetailWireframe = MovieDetailWireFrame()
    presenter.movieInteractor  = MovieDetailInteractor()
    presenter.movieInteractor?.presenter = presenter
  }
  
}
