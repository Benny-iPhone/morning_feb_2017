//: Playground - noun: a place where people can play

import UIKit

//function
pow(2, 4)
//method
let imageView = UIImageView()
imageView.startAnimating()

class Dog{
    
    var barksCounter : Int
    
    init() {
        barksCounter = 0
    }
    
    func bark(){
        barksCounter += 1
    }
    
    func bark(count : Int){
        for _ in 0..<count{
            bark()
        }
    }
    
    func barkAt(d : Dog){
        self.bark()
        d.bark()
    }
}

let rexi = Dog()
rexi.bark()
rexi.bark(count: 10)
rexi.barksCounter

let roger = Dog()
rexi.barkAt(d: roger)

enum Color{
    case green
    
    func getColor() -> UIColor{
        return .green
    }
}

struct Point{
    var x : Double
    var y : Double
    
    func pointByAdding(x : Double) -> Point{
        return Point(x: self.x + x, y: y)
    }
    
    mutating func zeroX(){
        x = 0
    }
    
    mutating func makeZeo(){
        self = Point(x: 0, y: 0)
    }
}

var p1 = Point(x: 5, y: 5)
p1.zeroX()











