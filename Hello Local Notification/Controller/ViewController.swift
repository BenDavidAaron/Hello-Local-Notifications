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
        
        UNService.shared.authorize()
    }
    
    @IBAction func onTimerTapped() {
        print("timer")
        AlertService.actionSheet(in: self, title: "5 Secs"){
            UNService.shared.timerRequest(with: 5)
        }
        
    }
    
    @IBAction func onDateTapped() {
        print("date")
        AlertService.actionSheet(in: self, title: "Some future time"){
            var components = DateComponents()
            components.second = 0
            UNService.shared.dateRequest(with: components)
        }
        
    }
    
    @IBAction func onLocationTapped() {
        print("location")
        AlertService.actionSheet(in: self, title: "When I return"){
            
        }
    }
}

