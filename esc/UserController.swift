//
//  UserController.swift
//  esc
//
//  Created by Riley Pacella on 7/21/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class UserController: NSUserDefaults {
    static var sharedInstance = UserController()

    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    func saveUser(userName: String, password: String) {
    defaults.setObject(userName, forKey: "userName")
    defaults.setObject(password, forKey: "password")
    }
    

}
