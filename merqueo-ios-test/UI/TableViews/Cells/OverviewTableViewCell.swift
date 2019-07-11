//
//  OverviewTableViewCell.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/9/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import UIKit

class OverviewTableViewCell: UITableViewCell {

  @IBOutlet weak var content: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
