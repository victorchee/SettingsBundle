//
//  ViewController.swift
//  SettingsBundle
//
//  Created by qihaijun on 12/22/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        userDefaultsChanged(nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDefaultsChanged:", name: NSUserDefaultsDidChangeNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NSUserDefaultsDidChangeNotification, object: nil)
    }

    @IBAction func openApplicationSettings(sender: UIBarButtonItem) {
        guard let settingURL = NSURL(string: UIApplicationOpenSettingsURLString) else {
            return
        }
        UIApplication.sharedApplication().openURL(settingURL)
    }
    
    func userDefaultsChanged(sender: NSNotification?) {
        print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation())
    }
}

