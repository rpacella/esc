//
//  RouteViewController.swift
//  Esc
//
//  Created by Michelle Lee on 7/19/16.
//  Copyright © 2016 Michelle Lee. All rights reserved.
//

import UIKit
import MapKit


class RouteViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var trip: Trip?

    let locationManager = CLLocationManager()
    var locations:[CLLocationCoordinate2D]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "RouteTableViewCell", bundle: nil), forCellReuseIdentifier: "cellidentifier2")
        
        let routeLabel = UIBarButtonItem(title: "| Route", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        routeLabel.tintColor = UIColor.blackColor()
        routeLabel.setTitleTextAttributes([
            NSFontAttributeName: UIFont(name: "Hiragino Sans W6", size: 22.0)!,
            NSForegroundColorAttributeName: UIColor.blackColor()],
                                           forState: UIControlState.Normal)
        
        let listButton = UIBarButtonItem(title: "List", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.listAction))
        listButton.tintColor = UIColor.blackColor()
        listButton.setTitleTextAttributes([
            NSFontAttributeName: UIFont(name: "Hiragino Sans W3", size: 17.0)!,
            NSForegroundColorAttributeName: UIColor.blackColor()],
                                           forState: UIControlState.Normal)
        
        let backbutton = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.backAction))
        
        navigationItem.leftBarButtonItem = backbutton
        navigationItem.setRightBarButtonItems([routeLabel, listButton], animated: true)
        
        let location = CLLocationCoordinate2D(latitude: -34, longitude: 18.5)
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotations(self.setSpots())
        
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        mapView.addAnnotations(self.setSpots())
        tableView.reloadData()
    }
    
 
        
    let image = UIImage(named: "newPin")
        
        //Customize pin
        func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "myPins"
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) // as? MKPinAnnotationView
            
            
            if (annotationView == nil){
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                // MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                // annotationView?.pinTintColor = UIColor.blackColor()
                
                annotationView!.image = UIImage(named: "newPin")
                var frame = annotationView!.frame
                frame.size.height = 44
                frame.size.width = 25
                annotationView!.frame = frame
                
                annotationView!.canShowCallout = true
            }
            
            annotationView!.annotation = annotation
            return annotationView
        }
        
    
    class Restaurant: NSObject, MKAnnotation {
        var title: String? = ""
        var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    }
   
    
    class func spotList() -> [Restaurant] {
        
        let spot = Restaurant ()
        spot.title = "Workshop 17"
        spot.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        
        let spot2 = Restaurant ()
        spot2.title = "Truth Coffee"
        spot2.coordinate = CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)
        
        let spot3 = Restaurant ()
        spot3.title = "Chop Chop Coffee"
        spot3.coordinate = CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055)
        
        return [spot,spot2, spot3]
    }
    
    class Spot: NSObject, MKAnnotation {
        var title: String? = ""
        var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    }
    
     func setSpots() -> [Spot] {
        print(Trip.sharedInstance.eventList)
        
        let spot = Spot()
        spot.title = self.trip!.eventList[0].title
        //Trip.sharedInstance.eventList[0].title
        spot.coordinate = self.trip!.eventList[0].coordinate
        print(spot.coordinate)
        //Trip.sharedInstance.eventList[0].coordinate
        
        let spot2  = Spot()
        spot2.title = self.trip!.eventList[1].title
        spot2.coordinate = self.trip!.eventList[1].coordinate
        
        let spot3  = Spot()
        spot3.title = self.trip!.eventList[2].title
        spot3.coordinate = self.trip!.eventList[2].coordinate
        
        let spot4 = Spot()
        spot4.title = self.trip!.eventList[3].title
        spot4.coordinate = self.trip!.eventList[3].coordinate
        
        let spot5 = Spot()
        spot5.title = self.trip!.eventList[4].title
        spot5.coordinate = self.trip!.eventList[4].coordinate
        
        return [spot, spot2, spot3, spot4, spot5]
    }
    
    
    func backAction() {
        let cityView = CityTripViewController (nibName: "CityTripView", bundle: nil)
        self.navigationController?.pushViewController(cityView, animated: true)
    }
    
    func listAction() {
        let viewcontroller = TripListViewController (nibName: "TripListViewController", bundle: nil)
        
        viewcontroller.trip = self.trip
        
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
        return trip!.eventList.count
        
        }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellidentifier2") as! RouteTableViewCell
        
        cell.titleField.text = trip!.eventList[indexPath.row].title
        
        cell.tagField.text = trip!.eventList[indexPath.row].startTime + " - " + trip!.eventList[indexPath.row].endTime
        
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let eventViewController = EventViewController(nibName: "EventViewController", bundle: nil)
        
        eventViewController.eventTitle = trip!.eventList[indexPath.row].title!
        eventViewController.eventTime = trip!.eventList[indexPath.row].startTime + " - " + trip!.eventList[indexPath.row].endTime
        eventViewController.desc = trip!.eventList[indexPath.row].description
        
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
        self.navigationController?.pushViewController(eventViewController, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    


}
