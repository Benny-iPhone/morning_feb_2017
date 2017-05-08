//
//  AppDelegate.swift
//  FacebookIntergration
//
//  Created by Benny Davidovitz on 08/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FacebookCore
import Firebase

//http://stackoverflow.com/questions/29277494/integration-new-facebook-sdk-by-swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        FlowController.shared.window = window
        FlowController.shared.determineRoot()
        
        FIRApp.configure()
        
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppEventsLogger.activate(application)
    }


    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        debugPrint(url)
        
        if SDKApplicationDelegate.shared.application(app, open: url, options: options){
            return true
        }
        
        return true
        
    }
}










