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
    
    var trip = TripController.sharedInstance.returnTrip()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerNib(UINib(nibName: "ItineraryTableViewCell", bundle: nil), forCellReuseIdentifier: "cellidentifier")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return trip.eventList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // need reuseID
        let cell = tableView.dequeueReusableCellWithIdentifier("cellidentifier", forIndexPath: indexPath) as! ItineraryTableViewCell
        
        // fill in relevant fields of itinerary table view cell
        cell.titleField.text = trip.eventList[indexPath.row].title

        cell.descriptionField.text = trip.eventList[indexPath.row].startTime + " - " + trip.eventList[indexPath.row].endTime
        
        switch trip.eventList[indexPath.row].tag {
            case "Dining": cell.imageField.image = UIImage(named:"Eat.png")
            case "Entertainment": cell.imageField.image = UIImage(named:"Entertain.png")
            case "Museum": cell.imageField.image = UIImage(named:"Museum.png")
            case "Nightlife": cell.imageField.image = UIImage(named:"Nightlife.png")
            case "Outdoors": cell.imageField.image = UIImage(named: "Outdoor.png")
            case "Relax": cell.imageField.image = UIImage(named:"Relax.png")
            case "Shopping": cell.imageField.image = UIImage(named:"Shopping.png")
            case "Sightsee": cell.imageField.image = UIImage(named:"Sightsee.png")
            case "Tour": cell.imageField.image = UIImage(named:"Tour.png")
        default:
            break
            
        }
        
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
        
        eventViewController.titleField.text = trip.eventList[indexPath.row].title
        eventViewController.startEndTime.text = trip.eventList[indexPath.row].startTime + " - " + trip.eventList[indexPath.row].endTime
         eventViewController.descriptionField.text = trip.eventList[indexPath.row].description
         eventViewController.tagField.text = trip.eventList[indexPath.row].tag
            
        navigationController?.pushViewController(eventViewController, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }
    
    @IBAction func regenerateItinerary(sender: UIButton) {
        
        let newTrip = TripController.sharedInstance.returnTripTwo()
        
        trip = newTrip
        
        tableView.reloadData()
        
        // make another pull request for data, reload tableview data
        print("requested new itinerary")
    }
    
    
    @IBAction func saveItinerary(sender: UIButton) {
        
        // encode the trip
        let newTrip = trip
        TripController.sharedInstance.currentTrips.append(newTrip)
        
        let manager = NSFileManager.defaultManager()
        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documents.URLByAppendingPathComponent(newTrip.ID.UUIDString)
        
        NSKeyedArchiver.archiveRootObject(newTrip, toFile: fileURL.path!)
        
        let tripListViewController = TripListViewController(nibName: "TripListViewController", bundle: nil)
        
        tripListViewController.trip = newTrip
        navigationController?.pushViewController(tripListViewController, animated: true)
        
    }

}
