//: Playground - noun: a place where people can play

import UIKit

var str = "😇Hello, playground"
str.characters.count
(str as NSString).length
let r = str.range(of: "ell")!

let index = r.lowerBound
str[index]

let intIndex = str.distance(from: str.startIndex, to: r.lowerBound)

let objcRange : NSRange = (str as NSString).range(of: "ell")

objcRange.location

