//
//  AppManager.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import CoreLocation

class AppManager: NSObject {
    static let manager = AppManager()
    
    let locationManager : CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10 //meters
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            return
        case .denied, .restricted:
            debugPrint("location permission denied")
        case .notDetermined:
            //locationManager.requestWhenInUseAuthorization()
            
            //permission for background mode
            locationManager.requestAlwaysAuthorization()
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationDidEnterBackground, object: nil, queue: .main) { (_) in
            
            self.stopLocation()
            self.locationManager.startMonitoringSignificantLocationChanges()
            
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationWillEnterForeground, object: nil, queue: .main) { (_) in
         
            self.locationManager.stopMonitoringSignificantLocationChanges()
            self.startLocation()
            
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func startLocation(){
        locationManager.startUpdatingLocation()
    }
    
    func stopLocation(){
        locationManager.stopUpdatingLocation()
    }
    
}

extension Notification.Name{
    static var locationUpdated : Notification.Name{
        get{
            return Notification.Name(rawValue: "location_updated")
        }
    }
}

extension AppManager : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //print(locations[0])
        
        NotificationCenter.default.post(name: .locationUpdated, object: self)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}



























