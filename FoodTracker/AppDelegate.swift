//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Fan Zhang on 5/19/19.
//  Copyright © 2019 Fan Zhang. All rights reserved.
//

// Initialize the app & respond to app-level events

import UIKit

// Create the **entry point** to your app & a **run loop** that delivers input events to your app
// == UIApplicationMain(AppDelegate)
// - Create an application object: responsible for managing the life cycle of the app
// - Create an instance of `AppDelegate` class, assign it to the application object
// - The system launche your app
@UIApplicationMain

// Define `AppDelegate` class
// - Create the window
// - Provide a place to respond to state transitions within the app
// - Adopt the `UIApplicationDelegate` protocal: define methods to set up the app, espond to the app's state changes,
// & handle app-level events
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

