//
//  ViewController.swift
//  tips
//
//  Created by Thomas Mak on 12/15/14.
//  Copyright (c) 2014 Thomas Mak. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var totalLabelTwo: UILabel!
    @IBOutlet var totalLabelThree: UILabel!
    @IBOutlet var totalLabelFour: UILabel!
    
    let SESSION_TIP : String = "SESSION_TIP"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assign $0 as placeholder for total
        var totalPlaceholder = "$0.00"
        
        tipLabel.text = totalPlaceholder
        totalLabel.text = totalPlaceholder
        totalLabelTwo.text = totalPlaceholder
        totalLabelThree.text = totalPlaceholder
        totalLabelFour.text = totalPlaceholder
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // load the defaults
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipSession = defaults.integerForKey(self.SESSION_TIP)
        self.tipControl.selectedSegmentIndex = defaultTipSession
        self.onEditingChanged(self)

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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
    
        // tipPercentages array to call to action in runtime
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
     
        // convert billAmount string to double
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        // calculate for more than 1 person total
        var totalTwo = total / 2
        var totalThree = total / 3
        var totalFour = total / 4
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalLabelTwo.text = String(format: "$%.2f", totalTwo)
        totalLabelThree.text = String(format: "$%.2f", totalThree)
        totalLabelFour.text = String(format: "$%.2f", totalFour)
        
    }
    
    // gesture tap to remove # pad view
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

