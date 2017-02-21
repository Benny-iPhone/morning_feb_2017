//: Playground - noun: a place where people can play

import UIKit

func isMagicCube(_ c : [[Int]]) -> Bool{
    //validate dimenstions
    let size = c.count
    
    if size == 0{
        return true
    }
    
    for subArr in c{
        if subArr.count != size{
            return false
        }
    }
    
    //check all number are different
    var set : Set<Int> = []
    for i in 0..<size{
        for j in 0..<size{
            let num = c[i][j]
            if set.contains(num){
                return false
            }
            
            set.insert(num)
        }
    }
    
    //check sums
    var sum = 0
    for num in c[0]{
        sum += num
    }
    
    var diag1 = 0
    var diag2 = 0
    
    for i in 0..<size{
        var row = 0
        var col = 0
        
        for j in 0..<size{
            row += c[i][j]
            col += c[j][i]
        }
        
        if row != sum{
            return false
        }
        
        if col != sum{
            return false
        }
        
        //diagonals
        diag1 += c[i][i]
        diag2 += c[size-1-i][i]
    }
    
    if diag1 != sum{
        return false
    }
    
    if diag2 != sum{
        return false
    }
    
    return true
}

let arr = [
    [4,9,2],
    [3,5,7],
    [8,1,6]
]

isMagicCube(arr)


func vendingMachine(cost : Int, amount : Int) -> [Int]{
    let change = [100,50,20,10,5,2,1]
    var result = [Int](repeatElement(0, count: change.count))
    
    var total = amount - cost
    
    for i in 0..<change.count{
        let coin = change[i]
        result[i] = total / coin
        total = total % coin
    }
    
    return result
    
}
vendingMachine(cost: 9, amount: 500)























