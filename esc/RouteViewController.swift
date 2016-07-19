//
//  RouteViewController.swift
//  Esc
//
//  Created by Michelle Lee on 7/19/16.
//  Copyright © 2016 Michelle Lee. All rights reserved.
//

import UIKit
import MapKit

class RouteViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!

    
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
        
        let backbutton = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        
        navigationItem.leftBarButtonItem = backbutton
        navigationItem.setRightBarButtonItems([routeLabel, listButton], animated: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //    func backAction() {
    //        self.navigationController?.popViewControllerAnimated(true)
    //    }
    
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
