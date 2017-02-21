//: Playground - noun: a place where people can play

import UIKit

let sample : [Any] = [1,2,[3]]//[1,2,3,"str",[1,2,[3,[4]]],"[1,2,3]"]
//[1,2,[3]]
//[1,2,3]


func flat(arr : [Any]) -> [Any]{
    var result : [Any] = []
    
    for item in arr{
        if let subArr = item as? [Any]{
            result += flat(arr: subArr)
        } else {
            result.append(item)
        }
    }
    
    return result
}

print(flat(arr: sample))


