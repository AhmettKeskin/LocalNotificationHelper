//
//  AppDelegate.swift
//  LocalNotificationHelper
//
//  Created by Ahmet Keskin on 17/10/15.
//  Copyright © 2015 Ahmet Keskin. All rights reserved.
//

import UIKit

let ACTION_ONE_IDENTIFIER : String = "ACTION_ONE_IDENTIFIER"
let ACTION_TWO_IDENTIFIER : String = "ACTION_TWO_IDENTIFIER"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let actionOne = LocalNotificationHelper.sharedInstance.createUserNotificationActionButton(identifier: ACTION_ONE_IDENTIFIER, title: "Like")
        let actionTwo = LocalNotificationHelper.sharedInstance.createUserNotificationActionButton(identifier: ACTION_TWO_IDENTIFIER, title: "Dislike")
        
        let actions = [actionOne,actionTwo]
        
        LocalNotificationHelper.sharedInstance.registerUserNotificationWithActionButtons(actions: actions)
        
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
    
    // Local notification handle
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        print("notification - tapped")

    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        
        if identifier == ACTION_ONE_IDENTIFIER {
            print("action one - tapped")
            
            NSNotificationCenter.defaultCenter().postNotificationName(ACTION_ONE_IDENTIFIER, object: nil)
            
        }else if identifier == ACTION_TWO_IDENTIFIER {
            print("action two - tapped")
            
            NSNotificationCenter.defaultCenter().postNotificationName(ACTION_TWO_IDENTIFIER, object: nil)
        }
        
        completionHandler()
    }


}

