//
//  EventViewController.swift
//  Esc
//
//  Created by Michelle Lee on 7/17/16.
//  Copyright © 2016 Michelle Lee. All rights reserved.
//

import UIKit
import MapKit

class EventViewController: UIViewController {
    
    @IBOutlet weak var titleField: UILabel!
    
    @IBOutlet weak var startEndTime: UILabel!
    
    @IBOutlet weak var descriptionField: UILabel!
    
    @IBOutlet weak var eventImage: UIImageView!
    //var location: CLLocationCoordinate2D?
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    var eventTitle : String = ""
    var eventTime : String = ""
    var desc: String = ""
    var tag: String = ""
//    
//    init(eventTime: String, eventTitle: String, desc: String) {
//        self.eventTime = eventTime
//        self.eventTitle = eventTitle
//        self.desc = desc
//    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let itineraryImage = UIImage(named: "backItinerary")
        let button = UIBarButtonItem(image: itineraryImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.goBack))
        self.navigationItem.leftBarButtonItem = button
        titleField.text = eventTitle
        startEndTime.text = eventTime
        descriptionField.text = desc
        
        navigationController?.navigationBarHidden = false
        
        switch tag {
        case "Dining": eventImage.image = UIImage(named:"Eat.png")
        case "Entertainment": eventImage.image = UIImage(named:"Entertain.png")
        case "Museum": eventImage.image = UIImage(named:"Museum.png")
        case "Nightlife": eventImage.image = UIImage(named:"Nightlife.png")
        case "Outdoors": eventImage.image = UIImage(named: "Outdoor.png")
        case "Relax": eventImage.image = UIImage(named:"Relax.png")
        case "Shopping": eventImage.image = UIImage(named:"Shopping.png")
        case "Sightsee": eventImage.image = UIImage(named:"Sightsee.png")
        case "Tour": eventImage.image = UIImage(named:"Tour.png")
        default:
            break
        }
        eventImage.tintColor = UIColor.blackColor()

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
