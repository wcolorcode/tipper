//
//  SettingsViewController.swift
//  tips
//
//  Created by Thomas Mak on 12/16/14.
//  Copyright (c) 2014 Thomas Mak. All rights reserved.
//

import UIKit
import Foundation


class SettingsViewController: UIViewController {

    @IBOutlet var defaultTip: UISegmentedControl!
    @IBOutlet var segTheme: UISegmentedControl!
    
    let SESSION_TIP : String = "SESSION_TIP"
    let SESSION_THEME : String = "SESSION_THEME"
    let defaults = NSUserDefaults.standardUserDefaults()
    
    // select theme color
    @IBAction func actTheme(sender: UISegmentedControl) {
        
        switch(segTheme.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.whiteColor()
        case 1:
            self.view.backgroundColor = UIColor.darkGrayColor()
        default:
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // loads the key from NSUserDefaults
        self.defaultTip.selectedSegmentIndex = defaults.integerForKey("SESSION_TIP")
        self.segTheme.selectedSegmentIndex = defaults.integerForKey("SESSION_THEME")
        
        // loads the theme color
        var bgThemeNo: Int? = defaults.objectForKey("bgTheme") as Int?
        if (bgThemeNo == nil) {
            defaults.setObject(bgThemeNo, forKey: "bgTheme")
        }
        
        switch(bgThemeNo!){
        case 0:
            self.view.backgroundColor = UIColor.whiteColor()
        case 1:
            self.view.backgroundColor = UIColor.darkGrayColor()
        default:
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }

    
    @IBAction func onSave(sender: AnyObject) {
        
        // save tip key to NSUserDefaults
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[self.defaultTip.selectedSegmentIndex]
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(self.defaultTip.selectedSegmentIndex, forKey: self.SESSION_TIP)
        
        // save background theme to NSUserDefaults
        let bgThemeNo = segTheme.selectedSegmentIndex
        defaults.setObject(bgThemeNo, forKey: "bgTheme")
        defaults.setObject(bgThemeNo, forKey: self.SESSION_THEME)
        defaults.synchronize()
        
       // closes this view to main view
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
}
