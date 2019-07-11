//
//  DetailTableViewCell.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/9/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
  
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var poster: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    playButton.layer.cornerRadius = 30
    playButton.layer.borderWidth = 10
    playButton.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
   
  }
  
  
}
