//
//  PlanDayViewController.swift
//  escapeXibs
//
//  Created by Larissa Clopton on 7/18/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit

class PlanDayViewController: UIViewController {
    
    // need to update image

    @IBOutlet weak var AllDayPlan: UIButton!
    @IBOutlet weak var MorningPlan: UIButton!
    @IBOutlet weak var AfternoonPlan: UIButton!
    @IBOutlet weak var EveningPlan: UIButton!
    
    @IBOutlet weak var button1: UIImageView!
    @IBOutlet weak var button2: UIImageView!
    @IBOutlet weak var button3: UIImageView!
    @IBOutlet weak var button4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()

        button1.tintColor = UIColor.whiteColor()
        button2.tintColor = UIColor.darkGrayColor()
        button3.tintColor = UIColor.whiteColor()
        button4.tintColor = UIColor.whiteColor()
        configureButton(AllDayPlan)
        configureButton(MorningPlan)
        configureButton(AfternoonPlan)
        configureButton(EveningPlan)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureButton(button: UIButton) {
        button.backgroundColor = UIColor.whiteColor()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    @IBAction func presentCategoryPage(sender: UIButton) {
        
        let categoriesViewController = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
        
        // send time request to categories page, might need to change format
        // at the moment not using
        categoriesViewController.timeSpan = sender.tag
        
        navigationController?.pushViewController(categoriesViewController, animated: true)
    }

}
