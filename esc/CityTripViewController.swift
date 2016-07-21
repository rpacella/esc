//
//  CityTripViewController.swift
//  esc
//
//  Created by Riley Pacella on 7/18/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class CityTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(UINib(nibName: "DayV1Cell", bundle: nil), forCellReuseIdentifier: "day1cell")
        tableView.registerNib(UINib(nibName: "DayV2Cell", bundle: nil), forCellReuseIdentifier: "day2cell")

        
        let backImage = UIImage(named: "backArrow")
        let backButton = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(backButtonClicked))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
        
        let cityName = "Cape Town, South Africa" // get name from data array
        self.navigationItem.title = cityName
        
        
}

    
    func addButtonClicked() {
        
        let searchViewController = SearchViewController (nibName: "SearchViewController", bundle: nil)
        navigationController?.pushViewController(searchViewController, animated: true)
        
    }
    
    func backButtonClicked() {
        navigationController?.popViewControllerAnimated(true)
        navigationController?.navigationBarHidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
         navigationController?.navigationBarHidden = false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
        let cell : DayV1Cell = tableView.dequeueReusableCellWithIdentifier("day1cell") as! DayV1Cell
            if indexPath.row == 0 {
             cell.cellImageView?.image = UIImage(named: "cable")
            }
            if indexPath.row == 2 {
                cell.cellImageView?.image = UIImage(named: "penguin")
            }
            let cellNum = String(indexPath.row + 1)
            cell.dayNumberLabel.text = cellNum
            return cell
        }
        else {
            let cell : DayV2Cell = tableView.dequeueReusableCellWithIdentifier("day2cell") as! DayV2Cell
            let cellNum = String(indexPath.row + 1)
            if indexPath.row == 1 {
                cell.cellImageView?.image = UIImage(named: "wheel")
            }
            cell.dayNumberLabel.text = cellNum
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            let removed = TripController.sharedInstance.currentTrips.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
            
            let manager = NSFileManager.defaultManager()
            let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
//            let fileURL = documents.URLByAppendingPathComponent(removed.ID.UUIDString)
            
            do {
//                try NSFileManager.defaultManager().removeItemAtPath(fileURL.path!)
            } catch {
                print("cannot remove file")
            }
            
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //calulation to see how many days there are in NSCoding file
        /*
         return CityTripDaysArray.count
         */
        
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //push to itenerary for day
        //decode itenerary for day
//        let selectedTrip = TripController.sharedInstance.currentTrips[indexPath.row]
        
        // you can use selectedTrip to populate the table view of tripListViewController
        
        let tripListViewController = TripListViewController(nibName: "TripListViewController", bundle: nil)
        self.navigationController?.pushViewController(tripListViewController, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }

}
