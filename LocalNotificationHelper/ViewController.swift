//
//  ViewController.swift
//  LocalNotificationHelper
//
//  Created by Ahmet Keskin on 17/10/15.
//  Copyright © 2015 Ahmet Keskin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.likeActionButtonTapped(notification:)), name: NSNotification.Name(rawValue: ACTION_ONE_IDENTIFIER), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.dislikeActionButtonTapped(notification:)), name: NSNotification.Name(rawValue: ACTION_TWO_IDENTIFIER), object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendNotificationTapped(sender: AnyObject) {
        
        let userInfo = ["url" : "www.mobiwise.co"]
        LocalNotificationHelper.sharedInstance().scheduleNotificationWithKey(key: "mobiwise", title: "mobiwise", message: "Lets take a break", seconds: 5, userInfo: userInfo as [NSObject : AnyObject]?)
        
    }
    
    func likeActionButtonTapped(notification : NSNotification){
        self.imageView.image = UIImage(named: "icon_like")
    }
    
    func dislikeActionButtonTapped(notification : NSNotification){
        self.imageView.image = UIImage(named: "icon_dislike")

    }
    
}

