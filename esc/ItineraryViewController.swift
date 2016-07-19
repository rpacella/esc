//
//  ItineraryViewController.swift
//  escapeXibs
//
//  Created by Larissa Clopton on 7/18/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit

class ItineraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // dummy data
    var array = ["V&A Waterfront", "Cape Town Comedy Club", "Two Oceans Aquarium", "Robben Island"]
    
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
        
        // need to change
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // need reuseID
        let cell = tableView.dequeueReusableCellWithIdentifier("cellidentifier", forIndexPath: indexPath) as! ItineraryTableViewCell
        
        let title = array[indexPath.row]
        
        // fill in relevant fields of itinerary table view cell
        cell.titleField.text = title
        cell.descriptionField.text = "put description here"
        
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
        
        // need to change
        let chosenEvent = array[indexPath.row]
        
        print(chosenEvent)
        
        let eventViewController = EventViewController(nibName: "EventViewController", bundle: nil)
        
        navigationController?.pushViewController(eventViewController, animated: true)
        
        // bring to relevant description page, filling in apropriate values
        
        
    }
    
    @IBAction func regenerateItinerary(sender: UIButton) {
        // make another pull request for data, reload tableview data
        print("requested new itinerary")
    }
    
    
    @IBAction func saveItinerary(sender: UIButton) {
        // save the trip in appropriate format to the database
        // go to TripViewListController
        print("saved trip to database")
        
        let tripListViewController = TripListViewController(nibName: "TripListViewController", bundle: nil)
        
        navigationController?.pushViewController(tripListViewController, animated: true)
    }

}
