//
//  ItineraryViewController.swift
//  escapeXibs
//
//  Created by Larissa Clopton on 7/18/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit

class ItineraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // use Michelle's table view cell, get reuseID
        tableView.registerNib(UINib(nibName: "ItineraryTableViewCell", bundle: nil), forCellReuseIdentifier: "cellidentifier")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TripController.sharedInstance.returnTrip().eventList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // need reuseID
        let cell = tableView.dequeueReusableCellWithIdentifier("cellidentifier", forIndexPath: indexPath) as! ItineraryTableViewCell
        
        // fill in relevant fields of itinerary table view cell
        cell.titleField.text = TripController.sharedInstance.returnTrip().eventList[indexPath.row].title

        cell.descriptionField.text = TripController.sharedInstance.returnTrip().eventList[indexPath.row].tag
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return false
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // do nothing, cannot edit events
        print("tried to edit")
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let eventViewController = EventViewController(nibName: "EventViewController", bundle: nil)
        
        eventViewController.titleField.text = TripController.sharedInstance.returnTrip().eventList[indexPath.row].title
        eventViewController.startEndTime.text = TripController.sharedInstance.returnTrip().eventList[indexPath.row].startTime + " - " + TripController.sharedInstance.returnTrip().eventList[indexPath.row].endTime
         eventViewController.descriptionField.text = TripController.sharedInstance.returnTrip().eventList[indexPath.row].description
         eventViewController.tagField.text = TripController.sharedInstance.returnTrip().eventList[indexPath.row].tag
            
        navigationController?.pushViewController(eventViewController, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }
    
    @IBAction func regenerateItinerary(sender: UIButton) {
        //TODO - get another trip, can make returnTrip2 function in TripController
        // make another pull request for data, reload tableview data
        print("requested new itinerary")
    }
    
    
    @IBAction func saveItinerary(sender: UIButton) {
        
        // encode the trip
        let newTrip = Trip()
        
        TripController.sharedInstance.currentTrips.append(newTrip)
        let manager = NSFileManager.defaultManager()
        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documents.URLByAppendingPathComponent(newTrip.ID.UUIDString)
        
        NSKeyedArchiver.archiveRootObject(newTrip, toFile: fileURL.path!)
        
        let tripListViewController = TripListViewController(nibName: "TripListViewController", bundle: nil)
        navigationController?.pushViewController(tripListViewController, animated: true)
        
    }

}
