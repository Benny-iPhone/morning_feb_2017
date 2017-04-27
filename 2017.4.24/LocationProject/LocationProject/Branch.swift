//
//  Branch.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Branch: NSObject , MKAnnotation{
    let name : String
    let location : CLLocation
    
    var coordinate: CLLocationCoordinate2D{
        get{
            return location.coordinate
        }
    }
    
    var title: String?{
        get{
            return name
        }
    }
    
    init(name : String, lat : Double, lon : Double) {
        self.name = name
        self.location = CLLocation(latitude: lat, longitude: lon)
        
        super.init()
    }
    
    class func sampleArray() -> [Branch]
    {
        return [
            Branch(name: "Eiffel Tower", lat: 48.858, lon: 2.292),
            Branch(name: "benny's pizza", lat: 32.07, lon: 34.58),
            Branch(name: "Western Wall", lat: 31.776, lon: 35.232),
            Branch(name: "Dolphin's Reef", lat: 29.526, lon: 34.933)
        ]
    }
}
















