//
//  Utils.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 24/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocation{
    func getAddress(with completion : @escaping (CLPlacemark?,Error?)->Void){
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(self) { (placemarks, error) in
            completion(placemarks?.first,error)
        }
    }
}
