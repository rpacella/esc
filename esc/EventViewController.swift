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
    
    @IBOutlet weak var imageField: UIImageView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    var eventTitle : String = ""
    var eventTime : String = ""
    var desc: String = ""
    var imageTag: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let itineraryImage = UIImage(named: "backItinerary")
        let button = UIBarButtonItem(image: itineraryImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.goBack))
        self.navigationItem.leftBarButtonItem = button
        titleField.text = eventTitle
        startEndTime.text = eventTime
        imageField.image = imageTag
        
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
