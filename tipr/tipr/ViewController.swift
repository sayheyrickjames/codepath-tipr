//
//  ViewController.swift
//  tipr
//
//  Created by Rick James! Chatas on 4/2/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var boilerplateView: UIView!
    @IBOutlet weak var boilerplate2View: UIView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var originalHelloLabelPosition: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages [tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
    
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
    }
 
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func didTapBillField(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.boilerplateView.center.y = -100
            self.boilerplate2View.center.y = 210
        })
    }

    
 
}

