//
//  TripListViewController.swift
//  Esc
//
//  Created by Michelle Lee on 7/18/16.
//  Copyright © 2016 Michelle Lee. All rights reserved.
//

import UIKit
import CoreLocation

let backImage = UIImage(named: "backCapeTown")

class TripListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    
        tableView.registerNib(UINib(nibName: "ItineraryTableViewCell", bundle: nil), forCellReuseIdentifier: "cellidentifier")
        
        // Do any additional setup after loading the view.
        
        let routeButton = UIBarButtonItem(title: "Route", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.routeAction))
        routeButton.tintColor = UIColor.blackColor()
        routeButton.setTitleTextAttributes([
            NSFontAttributeName: UIFont(name: "Hiragino Sans W3", size: 17.0)!,
            NSForegroundColorAttributeName: UIColor.blackColor()],
                                           forState: UIControlState.Normal)
        
        let listLabel = UIBarButtonItem(title: "List |", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        listLabel.tintColor = UIColor.blackColor()
        listLabel.setTitleTextAttributes([
            NSFontAttributeName: UIFont(name: "Hiragino Sans W6", size: 22.0)!,
            NSForegroundColorAttributeName: UIColor.blackColor()],
                                           forState: UIControlState.Normal)
        let backbutton = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.backAction))
//        let cityName = "Cape Town, South Africa"
//        let backText = UIBarButtonItem(title: cityName, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.backAction))
//        backText.tintColor = UIColor.blackColor()
//        backText.setTitleTextAttributes([
//            NSFontAttributeName: UIFont(name: "Hiragino Sans W3", size: 15.0)!,
//            NSForegroundColorAttributeName: UIColor.blackColor()], forState: UIControlState.Normal)
//        
        navigationItem.leftBarButtonItem = backbutton
        navigationItem.setRightBarButtonItems([routeButton, listLabel], animated: true)
        
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func backAction() {
        
        let cityView = CityTripViewController(nibName: "CityTripView", bundle: nil)
        self.navigationController?.pushViewController(cityView, animated: true)
    }
    
    func routeAction() {
        let viewcontroller = RouteViewController (nibName: "RouteViewController", bundle: nil)
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellidentifier") as! ItineraryTableViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewcontroller = EventViewController (nibName: "EventViewController", bundle: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.pushViewController(viewcontroller, animated: true)//presentViewController(viewcontroller, animated: true, completion: nil)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
