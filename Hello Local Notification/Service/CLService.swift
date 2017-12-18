//
//  CLService.swift
//  Hello Local Notification
//
//  Created by Ben Aaron on 12-18-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import Foundation
import CoreLocation

class CLService: NSObject {
    
    private override init() {}
    static let shared = CLService()
    
    let locationManager = CLLocationManager()
    
    func authorize() {
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    
    func updateLocation() {
        locationManager.startUpdatingLocation()
    }
}

extension CLService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("got location")
    }
}
