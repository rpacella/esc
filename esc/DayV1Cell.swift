//
//  DayV1Cell.swift
//  esc
//
//  Created by Riley Pacella on 7/19/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class DayV1Cell: UITableViewCell {

    var randomImagesArray : [String] = ["penguin", "beach", "wheel", "mountain", "lionshead", "capetownDayPlanned", "fuji", "greece2", "sunset", "userBackground"]
    @IBOutlet weak var dayNumberLabel: UILabel!
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let random = Int(arc4random_uniform(10))
//        cellImageView.image = UIImage(named: randomImagesArray[random])
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
