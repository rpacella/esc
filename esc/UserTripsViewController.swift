//
//  UserTripsViewController.swift
//  esc
//
//  Created by Riley Pacella on 7/19/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class UserTripsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
//
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBarHidden = true
//        
        let registerViewController = RegisterViewController(nibName: "RegisterView", bundle: nil)
////  if not logged in:
        self.presentViewController(registerViewController, animated: false, completion: nil)
        let application = UIApplication.sharedApplication()
//        let window = application.keyWindow
//        window?.rootViewController = registerViewController

        tabBarItem.title = "Trips"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cityTripViewController = CityTripViewController(nibName: "CityTripView", bundle: nil)
        self.navigationController?.pushViewController(cityTripViewController, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}
