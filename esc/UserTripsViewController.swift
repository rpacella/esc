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
    
//    let application = UIApplication.sharedApplication()
//    let window = application.keyWindow

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        let backImage = UIImage(named: "backArrow")
        let backbutton = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = backbutton
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cityTripViewController = CityTripViewController(nibName: "CityTripView", bundle: nil)
        navigationController!.pushViewController(cityTripViewController, animated: true)
        navigationController?.navigationBarHidden = false
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}
