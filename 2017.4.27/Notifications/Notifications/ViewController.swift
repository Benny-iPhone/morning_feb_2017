//
//  ViewController.swift
//  Notifications
//
//  Created by Benny Davidovitz on 27/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var now = Int(Date().timeIntervalSince1970) //9:42:23
        now -= now % 60 //9:42:00
        now += 60 //9:43:00
        
        let date = Date(timeIntervalSince1970: TimeInterval(now))
        datePicker.minimumDate = date
        datePicker.date = date
        
    }

    @IBAction func makeNotificationAction(_ sender: Any) {
        guard let body = textField.text, !body.isEmpty else {
            return
        }
        
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = "Title"
            content.subtitle = "Subtitle"
            content.body = body
            content.sound = UNNotificationSound(named: "sound.mp3")
            content.badge = 3
            
            if let url = Bundle.main.url(forResource: "video", withExtension: "mp4"),
                let attach = try? UNNotificationAttachment(identifier: "vid", url: url, options: nil){
            
                content.attachments = [attach]
            }
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let request = UNNotificationRequest(identifier: "yyy", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        } else {
            // Fallback on earlier versions
            let note = UILocalNotification()
            note.alertTitle = "Message in a bottle"
            note.alertBody = body
            note.fireDate = datePicker.date
            note.applicationIconBadgeNumber = 1
            note.soundName = "sound.mp3"//UILocalNotificationDefaultSoundName
            note.userInfo = ["event_id":42]
            note.category = "cat"
            
            UIApplication.shared.scheduleLocalNotification(note)

        }
        
        
    }
    
    @IBAction func closeKeyboard(_ sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    

}












