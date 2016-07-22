//
//  AppDelegate.swift
//  esc
//
//  Created by Riley Pacella on 7/18/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController : UINavigationController!
    let tabBarController = UITabBarController()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        let userTripsViewController = UserTripsViewController(nibName: "UserTripsView", bundle: nil)
        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)

        let userNavCon = UINavigationController(rootViewController: userTripsViewController)
        let newTripNavCon = UINavigationController(rootViewController: searchViewController)
        let searchPage = MagGlassViewController(nibName: "MagGlassViewController", bundle: nil)
        
        
        let newEntry = UIImage(named: "newentry")
        let icon1 = UITabBarItem(title: "", image: newEntry, tag: 1)
        newTripNavCon.tabBarItem = icon1
        
        let userpic = UIImage(named: "tab2")
        let icon2 = UITabBarItem(title: "", image: userpic, tag: 2)
        userNavCon.tabBarItem = icon2
        
        let searchpic = UIImage(named: "searchpic")
        let icon3 = UITabBarItem(title: "", image: searchpic, tag: 3)
        searchPage.tabBarItem = icon3
        
        self.tabBarController.tabBar.tintColor = UIColor.redColor()
        
        self.tabBarController.setViewControllers([searchPage, newTripNavCon, userNavCon], animated: false)
        
        let loginView = LoginViewController(nibName: "LoginView", bundle: nil)
        self.tabBarController.selectedIndex = 2
        self.window?.rootViewController = loginView
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

