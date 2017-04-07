//
//  ViewController.swift
//  ShareAppDemoSwift
//
//  Created by SOTSYS113 on 03/04/17.
//  Copyright © 2017 SOTSYS113. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareButtonPressed(sender: UIButton) {
        
        let shareText = "Check out this cool app"
        let shareURL = NSURL(string: "http://www.apple.com")
        let image = UIImage(named: "apple.png")
        let activityArray = [shareText, shareURL!, image!] as [Any]
        let activityViewController = UIActivityViewController(activityItems: activityArray , applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityType.assignToContact, UIActivityType.addToReadingList]
        present(activityViewController, animated: true, completion: nil)
        
        func completionHandler(activityType: UIActivityType?, shared: Bool, items: [Any]?, error: Error?) {
            if (shared) {
                print("Cool user shared some stuff")
            }
            else {
                print("Bad user canceled sharing :(")
            }
        }
        
        activityViewController.completionWithItemsHandler = completionHandler
        
    }

}

