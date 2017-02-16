//: Playground - noun: a place where people can play

import UIKit

func factorial(of num : UInt) -> UInt{
    if num == 0{
        return 1
    }
    
    return num * factorial(of: num - 1)
    /*
    var sum : UInt = 1
    for i : UInt in 1...num{
        sum *= i
    }
    
    return sum
 */
}

factorial(of: 6)
/*
func test(_ num : Int){
    
}

test(4)
*/
//1000101001

public func solution(_ N : Int) -> Int {
    // write your code in Swift 3.0 (Linux)
    let str = String(N, radix: 2)
    print(str)
    
    var counter = 0
    var maxCount = 0
    var didStart = false
    
    for ch in str.characters{
        if ch == "1"{
            didStart = true
            if counter > maxCount{
                maxCount = counter
            }
            counter = 0

        }
        
        if didStart && ch == "0"{
            counter += 1
        }
        
    }
    
    return maxCount
}

solution(1376796946)

//0010000000100001


















