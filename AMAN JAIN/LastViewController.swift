//
//  LastViewController.swift
//  AMAN JAIN
//
//  Created by Aman Jain on 22/04/15.
//  Copyright (c) 2015 WWDC App. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Print
        
        println("Thanks For Considering Me")

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.LightContent
        
    }
    
    //Alert View
    
    @IBAction func showMessage() {
        
        let alertController = UIAlertController(title: "Thanks For Considering Me", message: "I look forward to your positive response!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK👍", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
   
    }
    

}
