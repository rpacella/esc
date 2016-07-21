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
    
    // switch start - end and tag order on view, also add constraints for tag
    
    @IBOutlet weak var titleField: UILabel!
    
    @IBOutlet weak var startEndTime: UILabel!
    
    @IBOutlet weak var descriptionField: UILabel!
    
    @IBOutlet weak var tagField: UILabel!
    
    var location: CLLocationCoordinate2D?
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let itineraryImage = UIImage(named: "backItinerary")
        let button = UIBarButtonItem(image: itineraryImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.goBack))
        self.navigationItem.leftBarButtonItem = button
        
    }
    
    func goBack()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
