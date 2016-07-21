//
//  RouteTableViewCell.swift
//  Esc
//
//  Created by Michelle Lee on 7/19/16.
//  Copyright © 2016 Michelle Lee. All rights reserved.
//

import UIKit

class RouteTableViewCell: UITableViewCell {

    @IBOutlet weak var titleField: UILabel!
    
    @IBOutlet weak var tagField: UILabel!
    
    @IBOutlet weak var imageField: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
