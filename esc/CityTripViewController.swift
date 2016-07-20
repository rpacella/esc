//
//  CityTripViewController.swift
//  esc
//
//  Created by Riley Pacella on 7/18/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class CityTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // need add button to present PlanDayViewController

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(UINib(nibName: "DayV1Cell", bundle: nil), forCellReuseIdentifier: "day1cell")
        
        let backImage = UIImage(named: "backArrow")
        let backButton = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(backButtonClicked))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
        
        let cityName = "Cape Town, South Africa" // get name from data array
        self.navigationItem.title = cityName
        
        
}

    
    func addButtonClicked() {
        
        let searchViewController = SearchViewController (nibName: "SearchViewController", bundle: nil)
        navigationController?.pushViewController(searchViewController, animated: true)
        
    }
    
    func backButtonClicked() {
        navigationController?.popViewControllerAnimated(true)
        navigationController?.navigationBarHidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
         navigationController?.navigationBarHidden = false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
         if section % 2 == 0 {
         cell?.imageView = dataArray.image
         return DayV1Cell
         }
         if section % 2 != 0 {
         cell?.imagView = dataArrat.image
         return DayV2Cell
         }
         
         */
        
       let cell = tableView.dequeueReusableCellWithIdentifier("day1cell")
        
        return cell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //calulation to see how many days there are in NSCoding file
        /*
         return CityTripDaysArray.count
         */
        
        return 1
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //push to itenerary for day
        //decode itenerary for day
        let tripListViewController = TripListViewController(nibName: "TripListViewController", bundle: nil)
self.navigationController?.pushViewController(tripListViewController, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }

}
