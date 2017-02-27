//: Playground - noun: a place where people can play

import UIKit

protocol WatermelonDelegate{
    func watermelonDidFinish(_ watermelon : Watermelon)
}

class Watermelon{
    var delegate : WatermelonDelegate?
    
    var capacity : UInt = 10{
        didSet{
            if capacity == 0{
                delegate?.watermelonDidFinish(self)
            }
        }
    }
    
    func slice(){
        guard capacity > 0 else {
            return
        }
        
        capacity -= 1
    }
}

class Waiter : NSObject, WatermelonDelegate{
    func watermelonDidFinish(_ watermelon: Watermelon) {
        print("order new watermelon")
    }
}

let w1 = Watermelon()
let george = Waiter()

w1.delegate = george

for _ in 0..<10{
    w1.slice()
}






















