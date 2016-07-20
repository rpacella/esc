//
//  CategoriesViewController.swift
//  escapeXibs
//
//  Created by Larissa Clopton on 7/18/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit
import CoreLocation

class CategoriesViewController: UIViewController, CLLocationManagerDelegate { //, WebService {
    
    // need background image?

    // might want to change this representation
    var timeSpan: Int?
    var latitude: Double?
    var longitude: Double?
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var entertainmentButton: UIButton!
    @IBOutlet weak var museumButton: UIButton!
    @IBOutlet weak var outdoorsButton: UIButton!
    @IBOutlet weak var nightlifeButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var diningButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self

        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done , target: self, action: #selector(doneButtonClicked))
        
        self.navigationItem.rightBarButtonItem = doneButton
        
        configureButton(entertainmentButton)
        configureButton(museumButton)
        configureButton(outdoorsButton)
        configureButton(nightlifeButton)
        configureButton(shoppingButton)
        configureButton(diningButton)

    }
    
    func doneButtonClicked() {
        
        // ask for current location
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        // determine what fields have been selected
        
        var categoriesArray = [String]()
        
        for view in self.view.subviews{
            if let item = view as? UIButton {
                if item.currentImage == UIImage(named:"checked.png") {
                    
                    switch item.tag {
                    case 0:
                        categoriesArray += ["entertainment"]
                    case 1:
                        categoriesArray += ["museum"]
                    case 2:
                        categoriesArray += ["outdoors"]
                    case 3:
                        categoriesArray += ["nightlife"]
                    case 4:
                        categoriesArray += ["shopping"]
                    case 5:
                        categoriesArray += ["dining"]
                    default:
                        break
                    }
                }
            }
        }
        
        let subtypes = ["subtypes":categoriesArray]
        let long = ["long":self.longitude]
        let lat = ["lat":self.latitude]
        
        // make post request with these fields and the location
//        let request = createMutableAnonRequest(NSURL(string: "http://ec2-52-33-4-120.us-west-2.compute.amazonaws.com:8000/hello"), method: "POST", parameters: subtypes, long, lat)
//        
//        executeRequest(request, requestCompletionFunction: {(responseCode, json) in
//            
//            if (responseCode/100 == 2)   {
//                
//                print(json)
//                
//                /*var eventList = [Event]()
//                
//                for event in json.arrayValue {
//                    
//                    let newEvent = Event()
//                    //newEvent.image
//                    //newEvent.title
//                    //newEvent.location
//                    //newEvent.description
//                    //newEvent.tags
//                    //newEvent.starttime
//                    //newEvent.endtime
//                    
//                    eventList.append(newEvent)
//                    
//                }
//                
//                onCompletion(list,nil)*/
//            }
//            /*else {
//                //the web service to create a user failed. Lets extract the error message to be displayed
//                let errorMessage = json["errors"]["full_messages"][0].stringValue
//                print(errorMessage)
//                //execute the closure in the ViewController
//                onCompletion(nil,errorMessage)
//            }*/
//        })
        
        let itineraryViewController = ItineraryViewController(nibName: "ItineraryViewController", bundle: nil)
        
        // set data in itineraryViewController table view based on pull request
        // itineraryViewController.eventList = eventList
        
        navigationController?.pushViewController(itineraryViewController, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureButton(button: UIButton) {
        button.setImage(UIImage(named:"unchecked.png"), forState: .Normal)
        button.tintColor = UIColor.whiteColor()

    }
    
   @IBAction func tick(sender: UIButton) {
    
        if sender.currentImage == UIImage(named:"unchecked.png") {
            sender.setImage(UIImage(named:"checked.png"), forState: .Normal)
        }
        else if sender.currentImage == UIImage(named:"checked.png") {
            sender.setImage(UIImage(named:"unchecked.png"), forState: .Normal)
        }
    
        sender.tintColor = UIColor.whiteColor()
    
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        self.latitude = Double((location?.coordinate.latitude)!)
        self.longitude = Double((location?.coordinate.longitude)!)
        
    }
    
}
