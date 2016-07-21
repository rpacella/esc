//
//  RegisterViewController.swift
//  esc
//
//  Created by Riley Pacella on 7/18/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImageView.image = UIImage(named: "logo")
        backgroundImageView.image = UIImage(named: "background")
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        let userTripsViewController = UserTripsViewController(nibName: "UserTripsView", bundle: nil)
        let userName = emailTextField.text
        let password = passwordTextField.text
        UserController.sharedInstance.saveUser(userName!, password: password!)
//        let planDay = PlanDayViewController(nibName: "PlanDayViewController", bundle: nil)
//        let tab = UITabBarController()
//        tab.viewControllers = [userTripsViewController, planDay]

        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
         let loginViewController = LoginViewController(nibName: "LoginView", bundle: nil)
        self.presentViewController(loginViewController, animated: true, completion: nil)
        
    }
   
    
}
