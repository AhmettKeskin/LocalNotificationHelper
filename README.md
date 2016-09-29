# LocalNotificationHelper

Local notification helper for swift

### About
LocalNotificationHelper is a swift class which helps you create - post local notifications and add action buttons for user notification easily


## Installation
  [Download](https://github.com/AhmettKeskin/LocalNotificationHelper/archive/master.zip) the project and copy the Source folder into your project and then simply you can use it in any file

#### Cocoapods

```swift
platform :ios, '8.0'
use_frameworks!

pod 'LocalNotificationHelper'
swift 3 | xCode 8
```
## Usage

``` swift
  
  // Create and post local notifications
  LocalNotificationHelper.sharedInstance().scheduleNotificationWithKey("mobiwise", title: "mobiwise", message: "Lets take a break", seconds: 5)
  
  /*
  LocalNotificationHelper.sharedInstance().scheduleNotificationWithKey(key: <#T##String#>, title: <#T##String#>, message: <#T##String#>, seconds: <#T##Double#>, userInfo: <#T##[NSObject : AnyObject]?#>)
  LocalNotificationHelper.sharedInstance().scheduleNotificationWithKey(key: <#T##String#>, title: <#T##String#>, message: <#T##String#>, date: <#T##NSDate#>, userInfo: <#T##[NSObject : AnyObject]?#>)
  LocalNotificationHelper.sharedInstance().scheduleNotificationWithKey(key: <#T##String#>, title: <#T##String#>, message: <#T##String#>, date: <#T##NSDate#>, soundName: <#T##String#>, userInfo: <#T##[NSObject : AnyObject]?#>)
  LocalNotificationHelper.sharedInstance().scheduleNotificationWithKey(key: <#T##String#>, title: <#T##String#>, message: <#T##String#>, seconds: <#T##Double#>, soundName: <#T##String#>, userInfo: <#T##[NSObject : AnyObject]?#>)
*/


```

``` swift
  // Create action buttons and register notification
  
  let actionOne = LocalNotificationHelper.sharedInstance().createUserNotificationActionButton(identifier: ACTION_ONE_IDENTIFIER, title: "Like")
        let actionTwo = LocalNotificationHelper.sharedInstance().createUserNotificationActionButton(identifier: ACTION_TWO_IDENTIFIER, title: "Dislike")
        
  let actions = [actionOne,actionTwo]
        
  LocalNotificationHelper.sharedInstance().registerUserNotificationWithActionButtons(actions: actions)

```

### Handle Local notifications 
```swift
  // Catching notifications in appdelegate 
  func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        print("notification - tapped")
    }
  
  // Handling action buttons and notifying where you need with notificationCenter  
  func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        if identifier == ACTION_ONE_IDENTIFIER {
            print("action one - tapped")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: ACTION_ONE_IDENTIFIER), object: nil)
            
        }else if identifier == ACTION_TWO_IDENTIFIER {
            print("action two - tapped")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: ACTION_TWO_IDENTIFIER), object: nil)
            
        }
        
        completionHandler()
    }
```

License
--------


  The MIT License (MIT)

Copyright (c) 2015 AhmetKeskin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

