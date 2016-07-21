//
//  CollectionViewCell.swift
//  esc
//
//  Created by Riley Pacella on 7/21/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
