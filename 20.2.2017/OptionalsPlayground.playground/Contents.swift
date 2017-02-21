//: Playground - noun: a place where people can play

import UIKit

var str = "123x"
let arr = [1,2,3]
let index : Int? = arr.index(of: 3)
var num1 : Int? = nil
var num2 : Int? = nil
//var num3 : Int? = num1 + num2

var num3 : Int = 0
if num1 != nil{
    num3 += num1!
}

if num2 != nil{
    num3 += num2!
}

let myStr = num3 == 0 ? "nils" : "not nils"

let sum = (num1 ?? 0) + (num2 ?? 0)

var sum1 = 0
num1 = 3
if let val = num1{
    sum1 += val
    print("not nil")
} else {
    print("nil")
}

if let num2 = num2{
    sum1 += num2
}

num2 = 15
if let num1 = num1, let num2 = num2, num1 > 0{
    print(num1 + num2)
}

let myStr1 = "123"
let nummmm = Int(myStr1) ?? 0
if let num = Int(myStr1){
    print(num)
}

let names = ["abc","123"]
names.last

if let l = names.last, let n = Int(l){
    n
}

extension String{
    func intVal() -> Int?{
        return Int(self)
    }
}

if let n = names.last?.intVal(){
    n
}

class Person{
    func walk(){
        
    }
}

let p : Person? = nil
p?.walk()

let dict : [String:Int]? = [
    "key":42
]

if let val = dict?["key"]{
    val
}

if let d = dict, let val = d["key"]{
    val
}

let value : Any = 50
let intValue : Int? = value as? Int

let person : [String:Any]? = [
    "first":"reuven",
    "last":"cohen",
    "age":18,
    "birthdate":0.0
]

if let age = person?["age"] as? Int{
    age
}

func age(of dict : [String:Any]?) -> Int?{
    guard let dict = dict else {
        return nil
    }
    
    guard let time = dict["birthdate"] as? Double else {
        return nil
    }
    
    let date = Date(timeIntervalSince1970: time)
    let now = Date()
    let calendar = Calendar.current
    let comps = calendar.dateComponents([.year], from: date, to: now)
    
    return comps.year ?? 0
}

age(of: person)


/*
 Write a function that receive a dictionary [String:String] represent a person
 return his full name
 */

func fullname(of dict : [String:String]?) -> String{
    guard let dict = dict else {
        return ""
    }
    
    var result = ""
    if let firstName = dict["first_name"]{
        result += firstName
        result += " "
    }
    
    if let middleName = dict["middle_name"]{
        result += middleName
        result += " "
    }
    
    if let lastName = dict["last_name"]{
        result += lastName
    }
    
    return result
    
    /*
    let firstName = dict["first_name"] ?? ""
    let middleName = dict["middle_name"] ?? ""
    let lastName = dict["last_name"] ?? ""
    
    return (firstName.isEmpty ? "" : firstName + " ")  + middleName + lastName
 */
}

let d : [String:String] = [
    "first_name":"benny",
    "last_name":"david"
]

fullname(of: d)
















