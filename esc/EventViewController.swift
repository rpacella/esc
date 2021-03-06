//
//  EventViewController.swift
//  Esc
//
//  Created by Michelle Lee on 7/17/16.
//  Copyright © 2016 Michelle Lee. All rights reserved.
//

import UIKit
import MapKit

class EventViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var titleField: UILabel!
    
    @IBOutlet weak var startEndTime: UILabel!
    
    @IBOutlet weak var descriptionField: UILabel!
    
    @IBOutlet weak var imageField: UIImageView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet var descField: UIView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var eventTitle : String = ""
    var eventTime : String = ""
    var desc: String = ""
    var imageTag: UIImage = UIImage()
    
    var trip: Trip?
    
    let locationManager = CLLocationManager()
    var location:CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let itineraryImage = UIImage(named: "backItinerary")
        let button = UIBarButtonItem(image: itineraryImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.goBack))
        self.navigationItem.leftBarButtonItem = button
        titleField.text = eventTitle
        startEndTime.text = eventTime
        imageField.image = imageTag
        imageField.tintColor = UIColor.blackColor()
        descriptionField.text = desc
        
        
        navigationController?.navigationBarHidden = false
        
        let location = CLLocationCoordinate2D(latitude: -34, longitude: 18.5)
        let span = MKCoordinateSpanMake(0.35, 0.35)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotations(self.setSpots())
        
        mapView.delegate = self

        
//        switch tag {
//        case "Dining": eventImage.image = UIImage(named:"Eat.png")
//        case "Entertainment": eventImage.image = UIImage(named:"Entertain.png")
//        case "Museum": eventImage.image = UIImage(named:"Museum.png")
//        case "Nightlife": eventImage.image = UIImage(named:"Nightlife.png")
//        case "Outdoors": eventImage.image = UIImage(named: "Outdoor.png")
//        case "Relax": eventImage.image = UIImage(named:"Relax.png")
//        case "Shopping": eventImage.image = UIImage(named:"Shopping.png")
//        case "Sightsee": eventImage.image = UIImage(named:"Sightsee.png")
//        case "Tour": eventImage.image = UIImage(named:"Tour.png")
//        default:
//            break
//        }
//        eventImage.tintColor = UIColor.blackColor()
//
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
        }
        
        annotationView!.annotation = annotation
        return annotationView
    }

    
    class Spot: NSObject, MKAnnotation {
        var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    }
    
    func setSpots() -> [Spot] {
        
        let spot = Spot()
        spot.coordinate = self.location!
        
        print(spot.coordinate)
        
        return [spot]
    }

    
    func goBack()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
