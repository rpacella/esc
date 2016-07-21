//
//  User.swift
//  esc
//
//  Created by Riley Pacella on 7/21/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class User: NSObject {
    var email : String
    var password : String
    var profPic : UIImage
    
    init(email: String, password: String, profPic: UIImage){
        self.email = email
        self.password = password
        self.profPic = profPic
    }
}
