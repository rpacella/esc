//
//  RouteViewController.swift
//  Esc
//
//  Created by Michelle Lee on 7/19/16.
//  Copyright © 2016 Michelle Lee. All rights reserved.
//

import UIKit
import MapKit

class Restaurant: NSObject, MKAnnotation {
    var title: String? = ""
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
}

class RouteViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!

    let locationManager = CLLocationManager()
    
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
        let cityName = "Cape Town, South Africa"
        let backText = UIBarButtonItem(title: cityName, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.backAction))
        backText.tintColor = UIColor.blackColor()
        backText.setTitleTextAttributes([
            NSFontAttributeName: UIFont(name: "Hiragino Sans W3", size: 17.0)!,
            NSForegroundColorAttributeName: UIColor.blackColor()], forState: UIControlState.Normal)
        
        navigationItem.setLeftBarButtonItems([backbutton, backText], animated: false)
        navigationItem.setRightBarButtonItems([routeLabel, listButton], animated: true)
        
        let location = CLLocationCoordinate2D(latitude: -34, longitude: 18.5)
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotations(RouteViewController.spotList())
        
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
//        mapView.addAnnotations(Trip.sharedInstance.getEvents())
        tableView.reloadData()
    }
    

    class Restaurant: NSObject, MKAnnotation {
        var title: String? = ""
        var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
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
    
    
    func backAction() {
        let cityView = CityTripViewController (nibName: "CityTripView", bundle: nil)
        self.navigationController?.pushViewController(cityView, animated: true)
        cityView.navigationItem.hidesBackButton = true
    }
    
    func listAction() {
        let viewcontroller = TripListViewController (nibName: "TripListViewController", bundle: nil)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cellidentifier2") as! RouteTableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewcontroller = EventViewController (nibName: "EventViewController", bundle: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.pushViewController(viewcontroller, animated: true)    }
    
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
