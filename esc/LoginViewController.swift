//
//  LoginViewController.swift
//  esc
//
//  Created by Riley Pacella on 7/18/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        logoImageView.image = UIImage(named: "logo")
        backgroundImageView.image = UIImage(named: "background")
    }
    
    override func viewWillAppear(animated: Bool) {
//        navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
//        let userTripsViewController = UserTripsViewController(nibName: "UserTripsView", bundle: nil)
//        let planDay = PlanDayViewController(nibName: "PlanDayViewController", bundle: nil)
//        let tab = UITabBarController()
//        tab.viewControllers = [userTripsViewController, planDay]
//        let userTripsViewController = UserTripsViewController(nibName: "UserTripsView", bundle: nil)
        
        if emailTextField.text == "" || passwordTextField.text == "" {
            let failAlert = UIAlertController(title: "Unable to login", message: "Please fill in all fields", preferredStyle:UIAlertControllerStyle.Alert)
        
            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
            failAlert.addAction(alertAction)
        
            self.presentViewController(failAlert, animated: true, completion: nil)
            
            return
        }
        
            self.presentViewController(tabBarController!, animated: true, completion: nil)
      
    }
 
    @IBAction func registerButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
