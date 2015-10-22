/*
The MIT License (MIT)

Copyright (c) 2015 AhmetKeskin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

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
    
    func postNotification(key key : String,title : String, message : String, seconds : Double){
        
        let notification = UILocalNotification()
        notification.alertAction = title
        notification.alertBody = message
        notification.userInfo = [
            "key": key,
            "title" : title,
            "message" : message,
        ]
        notification.soundName = UILocalNotificationDefaultSoundName
        let fireDate = NSDate(timeIntervalSinceNow: seconds)
        notification.fireDate = fireDate
        notification.hasAction = true
        notification.category = LOCAL_NOTIFICATION_CATEGORY
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    func postNotification(key key : String,title : String, message : String, date : NSDate){
        
        let notification = UILocalNotification()
        notification.alertAction = title
        notification.alertBody = message
        notification.userInfo = [
            "key": key,
            "title" : title,
            "message" : message,
        ]
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.fireDate = date
        notification.hasAction = true
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    func postNotification(key key : String,title : String, message : String, seconds : Double, soundName : String){
        
        let notification = UILocalNotification()
        notification.alertAction = title
        notification.alertBody = message
        notification.userInfo = [
            "key": key,
            "title" : title,
            "message" : message,
        ]
        notification.soundName = soundName
        let fireDate = NSDate(timeIntervalSinceNow: seconds)
        notification.fireDate = fireDate
        notification.hasAction = true
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    func postNotification(key key : String,title : String, message : String, date : NSDate, soundName : String){
        
        let notification = UILocalNotification()
        notification.alertAction = title
        notification.alertBody = message
        notification.userInfo = [
            "key": key,
            "title" : title,
            "message" : message,
        ]
        notification.soundName = soundName
        notification.fireDate = date
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
    
    func cancelAllNotifications(){
        UIApplication.sharedApplication().cancelAllLocalNotifications()
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