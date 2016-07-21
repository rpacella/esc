//
//  SearchViewController.swift
//  esc
//
//  Created by Michelle Lee on 7/20/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var button4: UIImageView!
    @IBOutlet weak var button3: UIImageView!
    @IBOutlet weak var button2: UIImageView!
    @IBOutlet weak var loadingPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        loadingPic.tintColor = UIColor.grayColor()
        //UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func currentLocationButton(sender: UIButton) {
        let planViewController = PlanDayViewController (nibName: "PlanDayViewController", bundle: nil)
        navigationController?.pushViewController(planViewController, animated: true)
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
