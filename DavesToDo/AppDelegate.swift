//
//  AppDelegate.swift
//  DavesToDo
//
//  Created by David Murphy on 12/31/17.
//  Copyright © 2017 David Murphy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    // MARK - CALLED WHEN APP IS LOADED
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Print path of persistent stored data
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        return true
    }

    //MARK - when something happens to phone when app is in the foreground. Prevent user from losing data when accepting a call, etc.
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    // MARK - When is no longer visible on screen. Tends to save data, so this is okay.
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    // MARK - When app will terminate; If another resource intensive app is being run, your app's resources may be claimed; or if someone force-quits the app. Integrate persistent data storage.
    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}

