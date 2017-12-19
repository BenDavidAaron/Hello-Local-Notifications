//
//  UNService.swift
//  Hello Local Notification
//
//  Created by Ben Aaron on 12-18-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import Foundation
import UserNotifications

class UNService: NSObject {
    
    private override init() {}
    static let shared = UNService()
    
    let unCenter = UNUserNotificationCenter.current()
    
    func authorize() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound, .carPlay]
        unCenter.requestAuthorization(options: options) { (granted, error) in
            print(error ?? "No UN auth error")
            guard granted else {
                print("user denied access")
                return
            }
            
            self.configure()
        }
    }
    
    func configure() {
        unCenter.delegate = self
    }
    
    func getAttachment(for id: NotificationAttachmentID) -> UNNotificationAttachment? {
        var imageName: String
        switch id {
        case .timer: imageName = "TimeAlert"
        case .date: imageName = "DateAlert"
        case .location: imageName = "LocationAlert"
        }
        
        guard let url = Bundle.main.url(forResource: imageName, withExtension: "png") else { return nil }
        do {
            let attachment = try UNNotificationAttachment(identifier: id.rawValue, url: url)
            return attachment
        } catch {
            return nil
        }
    }
    
    func timerRequest(with interval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = "Timer Finished"
        content.body = "Thats all Folks"
        content.sound = .default()
        content.badge = 1
        
        if let attachment = getAttachment(for: .timer){
            content.attachments = [attachment]
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
        let request = UNNotificationRequest(identifier: "userNotification.timer",
                                            content: content,
                                            trigger: trigger)
        unCenter.add(request)
    }
    
    func locationRequest() {
        UNService.shared.locationRequest()
        let content = UNMutableNotificationContent()
        content.title = "Location Trigger"
        content.body = "You Returned Here!"
        content.sound = .default()
        content.badge = 3
        
        if let attachment = getAttachment(for: .location){
            content.attachments = [attachment]
        }
        
        let request = UNNotificationRequest(identifier: "userNotification.location",
                                            content: content,
                                            trigger: nil)
        unCenter.add(request)
    }

    func dateRequest(with componets: DateComponents) {
        let content = UNMutableNotificationContent()
        content.title = "Date Trigger"
        content.body = "The future is now!"
        content.sound = .default()
        content.badge = 2
        
        if let attachment = getAttachment(for: .date){
            content.attachments = [attachment]
        }
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: componets, repeats: false)
        let request = UNNotificationRequest(identifier: "userNotification.date",
                                            content: content,
                                            trigger: trigger)
        unCenter.add(request)
    }
    
}

extension UNService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UN did recieve response")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("UN will present")
        
        let options: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(options)
    }
}
