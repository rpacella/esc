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
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add , target: self, action: #selector(addButtonClicked))
        self.navigationItem.rightBarButtonItem = addButton
        let backImage = UIImage(named: "backArrow")

}
    
    func addButtonClicked() {
        
        let planDayViewController = PlanDayViewController(nibName: "PlanDayViewController", bundle: nil)
        
        navigationController?.pushViewController(planDayViewController, animated: true)
        
    }
    
    func backButtonClicked() {
        
        let userProf = UserTripsViewController(nibName: "UserTripsView", bundle: nil)
        
        navigationController?.pushViewController(userProf, animated: true)
        
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
        return 1
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //calulation to see how many days there are in NSCoding file
        /*
         return CityTripDaysArray.count
         */
        
        return 2
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //push to itenerary for day
        //decode itenerary for day
        let tripListViewController = TripListViewController(nibName: "TripListViewController", bundle: nil)
        navigationController?.pushViewController(tripListViewController, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }

}
