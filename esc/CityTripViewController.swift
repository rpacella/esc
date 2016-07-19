//
//  CityTripViewController.swift
//  esc
//
//  Created by Riley Pacella on 7/18/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class CityTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
=======
class CityTripViewController: UIViewController {
    
    // need add button to present PlanDayViewController
>>>>>>> 970aa7393665c5ce85fde9f9638ab7444cf76791

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(UINib(nibName: "DayV1Cell", bundle: nil), forCellReuseIdentifier: "reuseCell")

    }
    
    override func viewWillAppear(animated: Bool) {
         navigationController?.navigationBarHidden = false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
         if section % 2 == 0 {
         return DayV1Cell
         }
         if section % 2 != 0 {
         return DayV2Cell
         }
         
         */
        
       let cell = tableView.dequeueReusableCellWithIdentifier("reuseCell")
        return cell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //calulation to see how many days there are in NSCoding
        /*
         return CityTripDaysArray.count
         */
        
        return 2
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //push to itenerary for day
        //decode itenerary for day
    }

}
