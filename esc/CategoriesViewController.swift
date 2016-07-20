//
//  CategoriesViewController.swift
//  escapeXibs
//
//  Created by Larissa Clopton on 7/18/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit
import CoreLocation

class CategoriesViewController: UIViewController, CLLocationManagerDelegate {

    // might want to change this representation
    var timeSpan: Int?
    var latitude: String?
    var longitude: String?
    
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
                        categoriesArray += ["entertain"]
                    case 1:
                        categoriesArray += ["museums"]
                    case 2:
                        categoriesArray += ["outdoor"]
                    case 3:
                        categoriesArray += ["nightlife"]
                    case 4:
                        categoriesArray += ["shopping"]
                   // case 5:
                        //categoriesArray += ["dining"]
                    default:
                        break
                    }
                }
            }
        }
        
        // other options: sightsee, relax, tour
        
        let eventList = GenerateItineraryController.sharedInstance.generateItinerary(categoriesArray, long: self.longitude!, lat: self.latitude!)
        
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
        
        self.latitude = String((location?.coordinate.latitude))
        self.longitude = String((location?.coordinate.longitude))
        
    }
    
}
