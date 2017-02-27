//: Playground - noun: a place where people can play

import UIKit
import CoreLocation

class AirPlane{
    
    var hours : Double = 0
    var coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    class func treatment(for hours : Double) -> String{
        return ""
    }
    
}

class UltarLight : AirPlane{
    override class func treatment(for hours : Double) -> String{
        if hours < 300{
            return "nothing"
        } else if hours > 900{
            return "300 & 900"
        }
        
        return ""
    }
}


class DatabaseManager{
    
    static let manager = DatabaseManager()
    /*
    private static var _manager : DatabaseManager?
    
    class func shared() -> DatabaseManager{
        if let _manager = _manager{
            return _manager
        } else {
            _manager = DatabaseManager()
            return _manager!
        }
    }
    */
    func connect(){
        
    }
}

DatabaseManager.manager.connect()

let m1 = DatabaseManager()




















