//: Playground - noun: a place where people can play

import UIKit

//let ages : Dictionary<String,Int>
let ages : [String:Int] = [
    "maor":23,
    "benny":29,
    "mendi":27
]

var emptyDict : [String:Any] = [:]
var empryDict2 = [String:Any]()

emptyDict["key"] = 42

emptyDict

emptyDict["key"] = 43

emptyDict

emptyDict["key"] = nil
emptyDict.removeValue(forKey: "key")
emptyDict["key1"] = 41
emptyDict


let benny = ages["benny"]
let aviv = ages["aviv"]

let keys = Array(ages.keys).sorted()
let values = Array(ages.values)

ages.count

for k in keys{
    let age = ages[k]
    
}

for (key, val) in ages{
    print(key + " :\(val)")
}

//sorting array

var arr = [4,42,78,96,0,2,-5]
let arr2 = arr.sorted()
arr
arr.sort()
arr.sort(by: >)
arr.sort(by: ==)








