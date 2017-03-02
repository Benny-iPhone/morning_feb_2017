//: Playground - noun: a place where people can play

import UIKit

struct Point{
    var x : Double = 0
    var y : Double = 0
    
    func distance(from p : Point) -> Double{
        let a = self.x - p.x
        let b = y - p.y
        return sqrt(pow(a, 2) + pow(b, 2))
    }
}

let p1 = Point(x: 1, y: 1)
var p2 = Point()

p1.distance(from: p2)

p2.x = 5

struct Triangle{
    var p1 : Point
    var p2 : Point
    var p3 : Point
}

let t = Triangle(p1: Point(), p2: Point(x:5,y:5), p3: Point(x: 5, y: 0))

class Person{
    var name : String = ""
}

let per1 = Person()
per1.name = "david"

let per2 = per1
per2.name = "moshe"

var point1 = Point()
point1.x = 3

var point2 = point1
point2.x = 4

let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))

var rect = label1.frame
rect.origin.y += 100

let label2 = UILabel(frame: rect)

var arr1 = [Person(),Person()]
arr1[0].name = "a"
var arr2 = arr1
arr2.append(Person())
arr2[0].name = "b"











