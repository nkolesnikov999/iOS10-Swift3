//
//  ViewController.swift
//  NewNotifications
//
//  Created by NK on 21.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Request permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted, error) in
            if granted {
                print("Notification access granted")
            } else {
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    @IBAction func notifyButtonTapped(_ sender: UIButton) {
        scheduleNotification(inSeconds: 5) { success in
            if success {
                print("YES")
            } else {
                print("NO")
            }
        }
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ success: Bool) -> ()) {
        
        // Add an attachment
        let myImage = "rick_grimes"
        guard let imageUrl = Bundle.main.url(forResource: myImage, withExtension: "gif") else {
            completion(false)
            return
        }
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "myNotification", url: imageUrl, options: .none)
        
        let notif = UNMutableNotificationContent()
        
        // ONLY FOR EXTENSIONS
        notif.categoryIdentifier = "myNotificationCategory"
        
        notif.title = "New Notification"
        notif.subtitle = "These are great"
        notif.body = "The new notification options in iOS 10 are what I've always dreamed of!"
        notif.attachments = [attachment]
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            } else {
                completion(true)
            }
        })
    }
}

