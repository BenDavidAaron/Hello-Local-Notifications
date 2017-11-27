//
//  ViewController.swift
//  Hello Local Notification
//
//  Created by Ben Aaron on 11-26-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onTimerTapped() {
        print("timer")
    }
    
    @IBAction func onDateTapped() {
        print("date")
    }
    
    @IBAction func onLocationTapped() {
        print("location")
    }
}

