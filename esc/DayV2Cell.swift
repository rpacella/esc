//
//  DayV2Cell.swift
//  esc
//
//  Created by Riley Pacella on 7/20/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class DayV2Cell: UITableViewCell {

    var randomImagesArray : [String] = ["penguin", "beach", "wheel", "mountain", "lionshead"]
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var dayNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let random = Int(arc4random_uniform(5))
        cellImageView.image = UIImage(named: randomImagesArray[random])    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
