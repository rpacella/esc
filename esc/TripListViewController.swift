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
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var trip: Trip?
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundView = backgroundImage
        
        navigationController?.navigationBarHidden = false
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
        
        viewcontroller.locations = returnLocations()
        viewcontroller.trip = trip
        
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func returnLocations() -> [CLLocationCoordinate2D] {
        
        var locations = [CLLocationCoordinate2D]()
        
        for item in (self.trip?.eventList)! {
            let event = item as? Event
            locations.append(event!.coordinate)
        }
        
        return locations
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return trip!.eventList.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellidentifier") as! ItineraryTableViewCell
        
        cell.titleField.text = trip!.eventList[indexPath.row].title
        
        cell.descriptionField.text = trip!.eventList[indexPath.row].startTime + " - " +  trip!.eventList[indexPath.row].endTime
        
        switch trip!.eventList[indexPath.row].tag {
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
        
        cell.imageField.tintColor = UIColor.blackColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.alpha = 0.6
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let eventViewController = EventViewController(nibName: "EventViewController", bundle: nil)
        
        eventViewController.eventTitle = trip!.eventList[indexPath.row].title!
        eventViewController.eventTime = trip!.eventList[indexPath.row].startTime + " - " + trip!.eventList[indexPath.row].endTime
        eventViewController.desc = trip!.eventList[indexPath.row].eventDescription
        eventViewController.location = trip!.eventList[indexPath.row].coordinate
        
        switch trip!.eventList[indexPath.row].tag {
        case "Dining": eventViewController.imageTag = UIImage(named:"Eat.png")!
        case "Entertainment": eventViewController.imageTag = UIImage(named:"Entertain.png")!
        case "Museum": eventViewController.imageTag = UIImage(named:"Museum.png")!
        case "Nightlife": eventViewController.imageTag = UIImage(named:"Nightlife.png")!
        case "Outdoors": eventViewController.imageTag = UIImage(named: "Outdoor.png")!
        case "Relax": eventViewController.imageTag = UIImage(named:"Relax.png")!
        case "Shopping": eventViewController.imageTag = UIImage(named:"Shopping.png")!
        case "Sightsee": eventViewController.imageTag = UIImage(named:"Sightsee.png")!
        case "Tour": eventViewController.imageTag = UIImage(named:"Tour.png")!
        default:
            break
            
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.pushViewController(eventViewController, animated: true)//presentViewController(viewcontroller, animated: true, completion: nil)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }

}
