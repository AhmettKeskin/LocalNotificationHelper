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

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "likeActionButtonTapped:", name: ACTION_ONE_IDENTIFIER, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dislikeActionButtonTapped:", name: ACTION_TWO_IDENTIFIER, object: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendNotificationTapped(sender: AnyObject) {
        
        LocalNotificationHelper.sharedInstance.postNotification(key: "mobiwise", title: "mobiwise", message: "Lets take a break", seconds: 5)
    }
    
    func likeActionButtonTapped(notification : NSNotification){
        self.imageView.image = UIImage(named: "icon_like")
    }
    
    func dislikeActionButtonTapped(notification : NSNotification){
        self.imageView.image = UIImage(named: "icon_dislike")

    }
    
}

