//: Playground - noun: a place where people can play

import UIKit

enum Direction{
    case up
    case down
    case right, left
    
    func toString() -> String{
        switch self {
        case .down: return "👇"
        case .up: return "👆"
        case .left: return "👈"
        case .right: return "👉"
        }
    }
}

let d1 = Direction.up
let d2 : Direction = .down
var d3 = Direction.right
d3 = .left
d3.toString()

func goTo(direction d : Direction){
    print(d.toString())
}

//goTo(direction: .up)


enum Weekday : Int{
    case sunday = 1, monday
    case tuesday
    case wednesday, thursday, friday
    case saturday
    
    func nextDay() -> Weekday{
        if let next = Weekday(rawValue: self.rawValue + 1){
            return next
        } else {
            return .sunday
        }
    }
    
    func prevDay() -> Weekday{
        if let prev = Weekday(rawValue: rawValue - 1){
            return prev
        } else {
            return .saturday
        }
    }
}

let day1 : Weekday = .monday
day1.rawValue
day1.nextDay().prevDay()

let day : Weekday? = Weekday(rawValue: 6)
day?.nextDay().nextDay()


enum Tables : String{
    case user = "useres"
    case branch = "branches"
}

enum UserFields : String{
    case firstname = "first_name"
    case lastname = "last_name"
    case uid = "user_id"
}















