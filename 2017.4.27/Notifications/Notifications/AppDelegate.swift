//
//  AppDelegate.swift
//  Notifications
//
//  Created by Benny Davidovitz on 27/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import TWMessageBarManager
import AVFoundation
import UserNotifications
import UserNotificationsUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var player : AVAudioPlayer?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        application.applicationIconBadgeNumber = 0
        
        if #available(iOS 10.0, *) {
            
            //let action = UNNotificationAction(identifier: "reply", title: "Reply", options: [])
            let inputAction = UNTextInputNotificationAction(identifier: "reply", title: "Reply", options: .authenticationRequired, textInputButtonTitle: "Send", textInputPlaceholder: "Type a reply")
            
            let cat = UNNotificationCategory(identifier: "cat2", actions: [inputAction], intentIdentifiers: [], options: .allowInCarPlay)
            
            UNUserNotificationCenter.current().setNotificationCategories([cat])
            
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge, .carPlay]) { (success, error) in
                guard success else{
                    debugPrint(error!)
                    return
                }
                
                application.registerForRemoteNotifications()
            }
        } else {
            // Fallback on earlier versions
            requestNotifcationPermission()
        }
        
        
        return true
    }

    func requestNotifcationPermission(){
        
        let application = UIApplication.shared
        /*
        let showAction = UIMutableUserNotificationAction()
        showAction.identifier = "show"
        showAction.title = "תראה"
        showAction.activationMode = .foreground
        showAction.isDestructive = true
        */
        
        let replyAction = UIMutableUserNotificationAction()
        replyAction.identifier = "reply"
        replyAction.title = "השב"
        replyAction.activationMode = .background
        replyAction.behavior = .textInput
        
        replyAction.parameters = [
            UIUserNotificationTextInputActionButtonTitleKey:"תענה לו"
        ]
        
        
        let laterAction = UIMutableUserNotificationAction()
        laterAction.identifier = "later"
        laterAction.title = "מחר כך"
        laterAction.activationMode = .background
        laterAction.isAuthenticationRequired = false
        
        let cat = UIMutableUserNotificationCategory()
        cat.identifier = "cat"
        cat.setActions([replyAction,laterAction], for: .default)
        
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: [cat])
        application.registerUserNotificationSettings(settings)
        
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
        application.applicationIconBadgeNumber = 0
        
        let state = application.applicationState
        switch state {
        case .active:
            if player == nil{
                let url = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
                player = try? AVAudioPlayer(contentsOf: url)
            }
            
            player?.play()
            
            debugPrint("active")
            TWMessageBarManager.sharedInstance().showMessage(withTitle: notification.alertTitle, description: notification.alertBody, type: .info, duration: 10, statusBarHidden: false, callback: { 
        
                if let eventID = notification.userInfo?["event_id"] as? Int{
                    debugPrint("show event for id \(eventID)")
                }
                
            })
            
            return
            
        case .background, .inactive:
            debugPrint("not active")
        }
        
        if let eventID = notification.userInfo?["event_id"] as? Int{
            debugPrint("show event for id \(eventID)")
        }
        
    }

    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        
        if identifier == "show"{
            debugPrint("show event screen")
        } else if identifier == "later"{
            notification.fireDate = Date(timeIntervalSinceNow: 5)
            application.applicationIconBadgeNumber = 0
            application.scheduleLocalNotification(notification)
        }
        
        //notify iOS 
        completionHandler()
        
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
        let text = responseInfo[UIUserNotificationActionResponseTypedTextKey] as? String ?? ""
        
        debugPrint(text)
        
        completionHandler()
        
    }
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        application.registerForRemoteNotifications()
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        debugPrint(deviceToken as NSData)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint(error)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        if let event_id = userInfo["event_id"] as? Int{
            debugPrint(event_id)
        }
    }
    
    //just button
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
    }
    
    //input
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
    }
    
    /*
    //for silent notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
 */
}

@available(iOS 10.0, *)
extension AppDelegate : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let res = response as? UNTextInputNotificationResponse{
            debugPrint(res.userText)
        }
        //apple's demand
        completionHandler()
    }
}













