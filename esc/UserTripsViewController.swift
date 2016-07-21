//
//  UserTripsViewController.swift
//  esc
//
//  Created by Riley Pacella on 7/19/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class UserTripsViewController: UIViewController /*, UICollectionViewDelegate, UICollectionViewDataSourceUITableViewDelegate, UITableViewDataSource*/ {
    
    
    @IBOutlet weak var city1Image: UIImageView!

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var city4View: UIButton!
    
    @IBOutlet weak var city2Image: UIImageView!
    
    @IBOutlet weak var city3Image: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
//    var screenSize: CGRect!
//    var screenWidth: CGFloat!
//    var screenHeight: CGFloat!
    
//    @IBOutlet weak var tableView: UITableView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        city1Image.image = UIImage(named: "penguin")
        city2Image.image = UIImage(named: "penguin")
        city3Image.image = UIImage(named: "penguin")
        city4View.setImage(UIImage(named: "penguin"), forState: .Normal)
    
        
//        screenSize = UIScreen.mainScreen().bounds
//        screenWidth = screenSize.width
//        screenHeight = screenSize.height
//        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: screenWidth / 2 - 150, bottom: 10, right: screenWidth / 2 - 150)
//        collectionView.frame = self.view.frame
//        collectionView.collectionViewLayout = layout
//
//        collectionView!.dataSource = self
//        collectionView!.delegate = self
//        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
//        collectionView!.backgroundColor = UIColor.whiteColor()
//        self.view.addSubview(collectionView!)
        
        
        //tableview
//        tableView.delegate = self
//        tableView.dataSource = self
        
        navigationController?.navigationBarHidden = true
     
        profileImageView.image = UIImage(named: "profile")
        
        let registerViewController = RegisterViewController(nibName: "RegisterView", bundle: nil)
        if let userName = defaults.stringForKey("userName") {
            print(userName)
            userNameLabel.text = userName
        }
        else {
        self.presentViewController(registerViewController, animated: false, completion: nil)
        }
    }
    
   
    
    @IBAction func capeTownButtonPressed(sender: AnyObject) {
        let cityTripViewController = CityTripViewController(nibName: "CityTripView", bundle: nil)
            self.navigationController?.pushViewController(cityTripViewController, animated: true)

    }
    
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSizeMake((collectionView.frame.size.width / 4), 100)
//    }
//    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 2
//    }
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
//
//        cell.backgroundColor = UIColor.blackColor()
//        cell.layer.borderWidth = 0
//        cell.frame.size.width = 150
//        cell.frame.size.height = 100
//        
////        cell.cityNameLabel.text = "Cape Town"
//        return cell
//    }
//
    
    
    
    
    
//    override func viewWillAppear(animated: Bool) {
//        tableView.reloadData()
//    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        return cell
//    }
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let cityTripViewController = CityTripViewController(nibName: "CityTripView", bundle: nil)
//        self.navigationController?.pushViewController(cityTripViewController, animated: true)
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
}
