//: Playground - noun: a place where people can play

import UIKit

func doNothing(){
    
}


func doSomething(){
    for _ in 0..<10{
        doNothing()
    }
    //print("doing somehting")
}

doSomething()

func doSomething(with num : Int){
    print(num)
}

func doSomething(num : Int){
    print(num)
}

func doSomething(_ num : Int){
    print(num)
}



doSomething(with: 54)
doSomething(num: 53)
doSomething(52)

func giveMeRandom(_ limit : Int) -> Int{
    let r = Int(arc4random() % UInt32(limit))
    return r
}

giveMeRandom(100)

arc4random_uniform(5)

func isFriday13th(_ date : Date) -> Bool{
    
    let calendar = Calendar(identifier: .gregorian)
    let comps = calendar.dateComponents([.day, .weekday], from: date)
    
    return comps.day == 13 && comps.weekday == 6
}

let d = Date(timeIntervalSince1970: 1234546890)//1487841600)
//Date().timeIntervalSince1970
isFriday13th(d)


func getAvg(of n1 : Double, and n2 : Double) -> Double{
    return (n1 + n2) / 2
}

getAvg(of: 10, and: 12)


func getAvg(of numbers : Double...) -> Double{
    var sum : Double = 0
    for n in numbers{
        sum += n
    }
    
    return sum / Double(numbers.count)
}

getAvg(of: 10,12,14,54,86)

let t1 = (1,"hello",4.5,doNothing)
t1.0

let t2 = (number : 1, str : "hello", double : 4.5, function: doNothing)

t2.function

func floorAndCeil(of n : Double) -> (floor: Int, ceil : Int){
    
    let f = Int(floor(n))
    let c = Int(ceil(n))
    
    return (f,c)
    
}

let result = floorAndCeil(of: -3.4)
result.floor
result.ceil
result.0

//[5,5,5,5,5,5,6,5]
//[0,5,10,15,20,25,30,36,41]
func solution(a : Int, b : Int, c : Int) -> Int{
    guard a <= b else {
        return 0
    }
    
    return b/c - a/c + (a % c == 0 ? 1 : 0)
}

solution(a: 12, b: 27, c: 13)

/*
 1,1,2,3,5,8,13,21,34
 
 f(n) = f(n-1) + f(n-2)
 f(1) = 1
 f(0) = 1
 */

func fibo(_ index : UInt) -> Int{

    switch index {
    case 0,1:
        return 1
    default:
        return fibo(index - 2) + fibo(index - 1)
    }
}

fibo(7)
//            3         5
//fibo(5) = fibo(3) + fibo(4)  = 8
/*
                2       1
 fibo(3) = |fibo(2)| + |fibo(1)| ||| 3
 fibo(2) = fibo(1) + fibo(0) = 1 + 1
            3           2
 fibo(4) = fibo(3) + fibo(2)
 */

class Student{
    var level : Int = 0
    
    func getCheckFunc() -> (Int)->Bool{
        var targetGrade = 0
        switch level {
        case 0: targetGrade = 60
        case 1: targetGrade = 70
        case 2: targetGrade = 80
        case 3: targetGrade = 90

        default:
            targetGrade = 100
        }
        
        func checkFunc(_ score : Int) -> Bool{
            return score >= targetGrade
        }
        
        return checkFunc
    }
}

let s = Student()
s.level = 0
let f = s.getCheckFunc()
let r1 = f(65)
//s.getCheckFunc()(50)



func norAction(_ b1 : Bool, _ b2 : Bool) -> Bool{
    return !(b1 || b2)
}

func nandAction(_ b1 : Bool, _ b2 : Bool) -> Bool{
    return !(b1 && b2)
}

func performBinaryAction(_ b1 : Bool, _ b2 : Bool, _ action : (Bool,Bool) -> Bool) -> Bool{
    return action(b1,b2)
}

performBinaryAction(true, false, norAction)



var arr : [Int] = [4,30,17,27,15]

func sortFunc(_ a : Int, _ b : Int) -> Bool{
    return arc4random() % 2 == 0
}

arr.sort(by: sortFunc)

arr.sort { (a, b) -> Bool in
    return a < b
}

arr.sort {
    $0 < $1
}



var num1 = 3
var num2 = 5

func mySwap(_ n1 : inout Int,_ n2 : inout Int){
    n1 = n1 + n2
    n2 = n1 - n2
    n1 = n1 - n2
}

mySwap(&num1, &num2)

num1
num2


func myPow(_ num : Int, _ p : Int = 2) -> Int{
    var sum = 1
    for _ in 0..<p{
        sum *= num
    }
    
    return sum
}

myPow(3)
myPow(4, 2)

























