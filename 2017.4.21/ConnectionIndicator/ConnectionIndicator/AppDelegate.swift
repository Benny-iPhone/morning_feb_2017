//
//  AppDelegate.swift
//  ConnectionIndicator
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        debugPrint(#function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        debugPrint(#function)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        debugPrint(#function)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        debugPrint(#function)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        debugPrint(#function)
    }


}

