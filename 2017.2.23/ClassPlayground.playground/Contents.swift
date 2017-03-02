//: Playground - noun: a place where people can play

import UIKit



class Node{
    var left : Node?
    lazy var right = Node()
}

let n = Node()
n.left
n.right.right.right.right.right


//Date()
class Car{
    enum `Type`{
        case familyCar, miniVan, jeep
    }
    let license : String
    let year : Int
    let type : Type
    var color : UIColor
    
    init(license : String,
         type : Type = .familyCar ,
         year : Int? = nil,
         color : UIColor? = nil) {
        
        self.license = license
        self.type = type
        
        if let year = year{
            self.year = year
        } else {
            let calendar = Calendar.current
            let comps = calendar.dateComponents([.year], from: Date())
            self.year = comps.year!
        }
        
        self.color = color ?? .white
        
    }
}


let myCar = Car(license: "12-345-67")
let myCar2 = Car(license: "12-346-67", year: 2000)
let myCar3 = Car(license: "12-233-33", year: 2010, color: .blue)

myCar.color


class Robot{
    var beepers : Int
    
    //    init() {
    //        beepers = 0
    //    }
    
    init(beepers : Int = 0) {
        self.beepers = beepers
    }
    
    func pickBeeper(){
        beepers += 1
    }
}

protocol DirtDelegate{
    
}

class iRobot : Robot{
    
}

extension iRobot : DirtDelegate{
    
}

let iBill = iRobot()
let b = iBill as Robot

let bill : Robot = Robot()
bill as? iRobot
bill.beepers
bill.pickBeeper()
bill.beepers
bill.beepers = 10
bill.beepers
//bill = Robot()

var billsWife : Robot? = Robot(beepers: 2)

class Square{
    static let minSize : Double = 1
    var size : Double{
        didSet{
            if size < Square.minSize{
                size = Square.minSize
            }
            print("size change from \(oldValue) to \(size)")
        }
    }
    var area : Double{
        get{
            return pow(size, 2)
        }
        set (newArea){
            size = sqrt(newArea)
        }
    }
    
    init(size : Double) {
        self.size = size
    }
    
    //not overrideable
    static func myStatFunc(){
        
    }
    //overrideable
    class func myClassFunc() -> Int{
        return 50
    }
}

Square.myClassFunc()

let sq = Square(size: 5)
sq.area
sq.area = 49
sq.size
















