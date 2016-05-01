//
//  ViewController.swift
//  Flashlight
//
//  Created by Ryan Walsh on 4/29/16.
//  Copyright © 2016 Ryan Walsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isOn = false
    
    @IBOutlet weak var onOffButton: UIButton!
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeRecognizer(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeRecognizer(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK Actions
    @IBAction func buttonTapped(sender: UIButton) {
        if isOn {
            onOffButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            mainView.backgroundColor = UIColor.blackColor()
            onOffButton.setTitle("On", forState: .Normal)
            isOn = !isOn
        } else {
            onOffButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            mainView.backgroundColor = UIColor.whiteColor()
            onOffButton.setTitle("Off", forState: .Normal)
            isOn = !isOn
        }
    }
    
    func swipeRecognizer(sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
            case UISwipeGestureRecognizerDirection.Up:
                onOffButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
                mainView.backgroundColor = UIColor.whiteColor()
                onOffButton.setTitle("Off", forState: .Normal)
                isOn = true
            case UISwipeGestureRecognizerDirection.Down:
                onOffButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                mainView.backgroundColor = UIColor.blackColor()
                onOffButton.setTitle("On", forState: .Normal)
                isOn = false
            default:
                break
        }
        
    }

}

