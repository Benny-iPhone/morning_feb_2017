//
//  NotificationService.swift
//  ServiceExtention
//
//  Created by Benny Davidovitz on 27/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let data = request.content.userInfo["data"] as? [String:String],
            let urlString = data["url"], let url = URL(string: urlString) {
            
            
            URLSession.shared.downloadTask(with: url, completionHandler: { (locationURL, _, error) in
                
                guard let locationURL = locationURL else{
                    self.contentHandler?(self.bestAttemptContent!)

                    return
                }
                
                let tmpDir = NSTemporaryDirectory()
                let tmpFile = "file://".appending(tmpDir).appending(url.lastPathComponent)
                let tmpURL = URL(string: tmpFile)!
                try! FileManager.default.moveItem(at: locationURL, to: tmpURL)

                let attachment = try! UNNotificationAttachment(identifier: "asd", url: tmpURL, options: nil)

                
                self.bestAttemptContent?.attachments = [attachment]
                
                self.contentHandler?(self.bestAttemptContent!)
                
                
            }).resume()
            
        }
        
        /*
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here...
            bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
            
            contentHandler(bestAttemptContent)
        }*/
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
