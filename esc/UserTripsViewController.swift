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
//        let registerViewController = RegisterViewController(nibName: "RegisterView", bundle: nil)
////  if not logged in:
//        self.presentViewController(registerViewController, animated: false, completion: nil)
//        let application = UIApplication.sharedApplication()
//        let window = application.keyWindow
//        window?.rootViewController = registerViewController

        let backImage = UIImage(named: "backArrow")
        let backbutton = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self, action: nil)
//        navigationItem.leftBarButtonItem = backbutton
//        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
//        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        tabBarItem.title = "Trips"
        
//        let tabBarController = UITabBarController()
//        let addTrip = PlanDayViewController(nibName: "PlanDayViewController", bundle: nil)
//        let profile = UserTripsViewController(nibName: "TripListView", bundle: nil)
//        tabBarController.viewControllers = [addTrip, profile]
//        let application = UIApplication.sharedApplication()
//        let window = application.keyWindow
//        window?.rootViewController = tabBarController
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
//    func backButtonClicked() {
//        
//        let userProf = UserTripsViewController(nibName: "UserTripsView", bundle: nil)
//        
//        navigationController?.pushViewController(userProf, animated: true)
//        
//    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}
