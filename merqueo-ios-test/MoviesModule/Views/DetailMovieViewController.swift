//
//  DetailMovieViewController.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/8/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
  
  var presenter = MoviePresenter()

  var movie: MovieData?
  
  var crews: [CrewData] = []
  
  var dataStructure:[String] = []
  
  @IBOutlet weak var list: UITableView!
  @IBOutlet weak var titleMovie: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setUpUI()
    presenter.viewRef = self
    presenter.viewDidLoad()
    if let id = movie?.id{
      presenter.getCastBy(user: id)
    }
  }
  
  func setUpUI() {
    if let movie = movie{
      if movie.poster_path != nil{
        dataStructure.append("detail")
      }
      if movie.overview != nil{
        dataStructure.append("overview")
      }
      if let title = movie.title{
        titleMovie.text = title
      }
      if let year = movie.release_date{
        dataStructure.append("year")

      }
    }
  }
 
  
  func setupTableView(){
    let nibDetail = UINib(nibName: "DetailTableViewCell", bundle: nil)
    list.register(nibDetail, forCellReuseIdentifier: Constants.CellIds.detailMovieCellId)
    let nibOvervier = UINib(nibName: "OverviewTableViewCell", bundle: nil)
    list.register(nibOvervier, forCellReuseIdentifier: Constants.CellIds.overviewCellId)
    let nibDescription = UINib(nibName: "DescriptionTableViewCell", bundle: nil)
    list.register(nibDescription, forCellReuseIdentifier: Constants.CellIds.descriptionCellId)

    //overviewCell
    list.delegate = self
    list.dataSource = self
    
    list.estimatedRowHeight = 300.0
    list.rowHeight = UITableView.automaticDimension
  }
  
  @IBAction func closeAction(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
}

extension DetailMovieViewController: UITableViewDataSource, UITableViewDelegate{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataStructure.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if dataStructure[indexPath.row] == "detail"{
      let cell = list.dequeueReusableCell(withIdentifier: Constants.CellIds.detailMovieCellId, for: indexPath) as! DetailTableViewCell
      
      if let url = movie?.poster_path{
        let link = "\(WebServiceAPIPaths.imageTheMovieDbDirectionsAPIPath)\(url)"
        cell.poster.downloaded(from: link, contentMode: .scaleAspectFill)
      }
      return cell
      
    } else if dataStructure[indexPath.row] == "overview"{
      let cell = list.dequeueReusableCell(withIdentifier: Constants.CellIds.overviewCellId, for: indexPath) as! OverviewTableViewCell
      if let overview = movie?.overview{
        cell.content.text = overview
      }
      return cell
    } else if dataStructure[indexPath.row] == "year"{
      let cell = list.dequeueReusableCell(withIdentifier: Constants.CellIds.descriptionCellId, for: indexPath) as! DescriptionTableViewCell
      cell.title.text = "Year"
      cell.content.text = movie?.release_date
      return cell
    } else if dataStructure[indexPath.row] == "crew"{
      let cell = list.dequeueReusableCell(withIdentifier: Constants.CellIds.descriptionCellId, for: indexPath) as! DescriptionTableViewCell
      cell.title.text = "Crew"
      let names = crews.compactMap({$0.name}).joined(separator: ", ")
      cell.content.text = "\(names)"
      return cell
    }
    let cell = list.dequeueReusableCell(withIdentifier: Constants.CellIds.descriptionCellId, for: indexPath)
    return cell
  }
 
}

//MARK: SearchPresenterProtocol
extension DetailMovieViewController: MovieDetailPresenterProtocol {
  func updateTheCurrentMovie(crew: [CrewData]?, error: Error?) {
    if let recentSavedSearchs = crew{
      self.crews = recentSavedSearchs
    }
    dataStructure.insert("crew", at: 2)
    self.list.beginUpdates()
    self.list.insertRows(at: [IndexPath.init(row: self.dataStructure.count-2, section: 0)], with: .bottom)
    self.list.endUpdates()
  }
}
