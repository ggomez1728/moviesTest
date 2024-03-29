//
//  MoviesViewController.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MoviesViewController: UIViewController {
  
  
  
  var presenter = MoviesPresenter()
  
  var moviesDB =  [Movie]()
  var moviesDBSaved =  [Movie]()
  
  var movies: [MovieData] = []{
    didSet{
      list.reloadData()
    }
  }
  var dateFormatter = DateFormatter()
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var list: UICollectionView!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewRef = self //The view reference for presenter of this screen.
    presenter.viewDidLoad()  //Inform the presenter about the view loading.
    dateFormatter.dateFormat = "dd-MM-YYYY"
    setupCollectionView()
    searchBar.delegate = self
    
    searchBar
      .rx.text // Observable property thanks to RxCocoa
      .orEmpty // Make it non-optional
      .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      // .filter { !$0.isEmpty }
      .subscribe(onNext :{ query in
        if query.isEmpty{
          self.presenter.getAllMovies(from: 1)
        } else {
          self.presenter.getMovies(for: query, page: 1)
        }
      })
      .disposed(by: disposeBag)
  }
  
  func setupCollectionView(){
    let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
    list.register(nib, forCellWithReuseIdentifier: Constants.CellIds.movieCellId)
    list.delegate = self
    list.dataSource = self
  }
  
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = list.dequeueReusableCell(withReuseIdentifier: Constants.CellIds.movieCellId, for: indexPath) as! MovieCollectionViewCell
    if let url = movies[indexPath.row].poster_path{
      let link = "\(WebServiceAPIPaths.imageTheMovieDbDirectionsAPIPath)\(url)"
      cell.image.downloaded(from: link )
    }
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.width / 3) - 5, height: 200)
    
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5.0
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter.movieDetailFetched(movie: movies[indexPath.row], errorMessage: "")
  }
}

//MARK: SearchPresenterProtocol
extension MoviesViewController: MoviePresenterProtocol {
  func updateTheRecentSearchList(recentSavedSearchs: [MovieData]?, error: Error?) {
    guard let recentSavedSearchs = recentSavedSearchs else { return }
    movies = recentSavedSearchs
    list.reloadData()

  }
  
  func updateTheRecentSearchList(recentSavedSearchs: [Movie]?, error: Error?) {
    guard let savedSearchResults = recentSavedSearchs else { return }
    moviesDBSaved =  savedSearchResults
    list.reloadData()
  }
  
  
  
  
}

extension MoviesViewController: UISearchBarDelegate{
  
}

