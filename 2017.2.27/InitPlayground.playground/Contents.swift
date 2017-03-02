//: Playground - noun: a place where people can play

import UIKit

class Person{
    var name : String
    var color : UIColor?
    
    init() {
        name = ""
    }
    
    init(name : String) {
        
        self.name = name
        
        walk()
    }
    
    func walk(){
        
    }
}

let p1 = Person(name: "")

class Student : Person{
    var course : String
    
    override init(name: String) {
        course = "iOS"
        super.init(name: name)
    }
}

let s1 = Student(name: "david")

//34,200,48
let color = UIColor(red: 34/255.0, green: 200/255.0, blue: 48/255.0, alpha: 1)
//aa00b3

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

UIColor(red: 34, green: 200, blue: 48)
UIColor(netHex: 0xaa00b3)

class TimerViewController{
    var timer : Timer?
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
}
































