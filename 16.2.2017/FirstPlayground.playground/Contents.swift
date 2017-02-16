//: Playground - noun: a place where people can play

import UIKit
/*
var str : String = "Hello, playground"

let num1 : Int = 1
let num2 : Int8 = 2
num1 + num2 + 1

var num3 = num1 + num2
num3 += 1
//num1 = 14

let num4 = 4.5
let num5 : Double = 3

let num6 = Double(num1 + num2 + num3) + num4 + num5
str = "num is \(num6) 😀" //"num is:" + num6
print(str)
print(num6)
print("result string is:" + str)

//let רדיוס = 5.6
let 💩💩💩 = "poop"
💩💩💩
*/

let pi : Double = M_PI
let radius : Double = 5.6

let surface = pi * pow(radius, 2)
var scope = 2 * pi * radius
scope -= scope.truncatingRemainder(dividingBy: 0.01)
scope


let surfaceString = String(format: "%.2f", surface)

let a = 1
let b = 2
let c = 3

if a < b{
    print("a smaller than b")
} else if a == b{
    print("a and b are equals")
} else {
    print("a is greater than b")
}

if a < b && b < c{
    print("numbers in sort")
} else {
    print("not sorted")
}

//a^2 + b^2 = c^2

let n1 = 3.0
let n2 = 4.0
let n3 = 5.0

if sqrt(pow(n1, 2) + pow(n2, 2)) == n3{
    print("pita")
} else {
    print("not pita")
}

if pow(n1, 2) + pow(n2, 2) == pow(n3, 2){
    print("pita 2")
}

let isPita = pow(n1, 2) + pow(n2, 2) == pow(n3, 2)

let day = 400
let t = (13,"king")
t.0
t.1
let t2 = (val: 14, name: "ace")
t2.name

switch day {
case Int.min...0, 8...Int.max:
    print("not valid day")
case 1: print("sunday")
case 2:
    print("monday")
case 3:
    print("tuseday")
case 4:
    print("wednesday")
case 5:
    print("thursday")
case 6:
    print("friday")
case 7:
    print("saturday")
default:
    break
}


for i in 0..<10{
    
}

for i in stride(from: 0, to: 10, by: 2){
    print(i)
}

let arr = [1,2,3,4,5,10,20]
for num in arr{
    
}

for i in 0..<arr.count{
    
}

for _ in 0..<1_000{
    
}

10_000_000_

//stride(from: <#T##T#>, through: <#T##T#>, by: <#T##T.Stride#>)

var count = 10
while count > 0 {
    count -= 3
}

func isSevenBoom( number : Int) -> Bool{
    if number == 0{
        return false
    }
    
    if number % 7 == 0{
        return true
    }

    var number = number
    while number > 0 {
        let digit = number % 10
        if digit == 7{
            return true
        }
        print(number)
        number /= 10
    }
    
    return false
}

var counter = 0
for n in 100..<200{
    if isSevenBoom(number: n){
        counter += 1
    }
}

counter

//isSevenBoom(number: 701)

var number1 = 4
var number2 = 12
String(number1, radix: 2)
let number2BinaryString = String(number2, radix: 2)
number1 & number2

let b1 : Bool = true
let b2 = false

b1 || !b1
b1 && !b1

let ch1 : Character = "a"
let ch2 : Character = "\u{1f496}"
















