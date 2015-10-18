//
//  LocalNotificationHelper.swift
//  LocalNotificationHelper
//
//  Created by Ahmet Keskin on 17/10/15.
//  Copyright © 2015 Ahmet Keskin. All rights reserved.
//

import Foundation

import AVKit

class LocalNotificationHelper: NSObject {
    
    let LOCAL_NOTIFICATION_CATEGORY : String = "LocalNotificationCategory"
    
    class var sharedInstance : LocalNotificationHelper {
        struct Static {
            static let instance : LocalNotificationHelper = LocalNotificationHelper()
        }
        return Static.instance
    }
    
    func createNotification(key key : String,title : String, message : String, seconds : Double){
        
        // create a corresponding local notification
        let notification = UILocalNotification()
        notification.alertAction = title // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        notification.alertBody = message // text that will be displayed in the notification
        notification.userInfo = [
            "key": key,
            "title" : title,
            "message" : message,
        ]
        notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        let fireDate = NSDate(timeIntervalSinceNow: seconds)
        notification.fireDate = fireDate // todo item due date (when notification will be fired)
        notification.hasAction = true
        notification.category = LOCAL_NOTIFICATION_CATEGORY
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    func createNotification(key key : String,title : String, message : String, date : NSDate){
        
        // create a corresponding local notification
        let notification = UILocalNotification()
        notification.alertAction = title // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        notification.alertBody = message // text that will be displayed in the notification
        notification.userInfo = [
            "key": key,
            "title" : title,
            "message" : message,
        ]
        notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        notification.fireDate = date // todo item due date (when notification will be fired)
        notification.hasAction = true
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    func createNotification(key key : String,title : String, message : String, seconds : Double, soundName : String){
        
        // create a corresponding local notification
        let notification = UILocalNotification()
        notification.alertAction = title // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        notification.alertBody = message // text that will be displayed in the notification
        notification.userInfo = [
            "key": key,
            "title" : title,
            "message" : message,
        ]
        notification.soundName = soundName // play default sound
        let fireDate = NSDate(timeIntervalSinceNow: seconds)
        notification.fireDate = fireDate // todo item due date (when notification will be fired)
        notification.hasAction = true
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    func createNotification(key key : String,title : String, message : String, date : NSDate, soundName : String){
        
        // create a corresponding local notification
        let notification = UILocalNotification()
        notification.alertAction = title // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        notification.alertBody = message // text that will be displayed in the notification
        notification.userInfo = [
            "key": key,
            "title" : title,
            "message" : message,
        ]
        notification.soundName = soundName // play default sound
        notification.fireDate = date // todo item due date (when notification will be fired)
        notification.hasAction = true
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    func getNotificationWithKey(key : String) -> UILocalNotification {
        
        var notif : UILocalNotification?
        
        for notification in UIApplication.sharedApplication().scheduledLocalNotifications! where notification.userInfo!["key"] as! String == key{
            notif = notification
            break
        }
        
        return notif!
    }
    
    func cancelNotification(key : String){
        
        for notification in UIApplication.sharedApplication().scheduledLocalNotifications! where notification.userInfo!["key"] as! String == key{
            UIApplication.sharedApplication().cancelLocalNotification(notification)
            break
        }
    }
    
    func getAllNotifications() -> [UILocalNotification] {
        
        return UIApplication.sharedApplication().scheduledLocalNotifications!
        
    }
    
    func registerUserNotificationWithActionButtons(actions actions : [UIUserNotificationAction]){
        
        let category = UIMutableUserNotificationCategory()
        category.identifier = LOCAL_NOTIFICATION_CATEGORY
        
        category.setActions(actions,
            forContext: UIUserNotificationActionContext.Default)
        
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: NSSet(object: category) as? Set<UIUserNotificationCategory>)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
    
    func createUserNotificationActionButton(identifier identifier : String, title : String) -> UIUserNotificationAction{
        
        let actionButton = UIMutableUserNotificationAction()
        actionButton.identifier = identifier
        actionButton.title = title
        actionButton.activationMode = UIUserNotificationActivationMode.Background
        actionButton.authenticationRequired = true
        actionButton.destructive = false
        
        return actionButton
    }
    
}