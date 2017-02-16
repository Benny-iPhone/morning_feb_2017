//: Playground - noun: a place where people can play

import UIKit

let arr1 = [1,2,3]
let arr2 : [Int] = [1,2,3]
let arr3 : Array<Int> = [1,2,3]

let arr4 : [Any] = [1.5,arr1,"string",UIImagePickerControllerCameraDevice.rear,UILabel()]


//let num = arr4[0] as? Int


var array = [Int](repeatElement(0, count: 5))

array[0] //if array is empty => crash 💩
array.first //return nil if array is empty
array.last
array.count

array.insert(3, at: 2)
array.append(5)
array += arr1

array[0] = -1
array[3...5] = [4,4]
array
array[0..<2] = []
array

let names : [String] = ["benny","gil","menashe"]

for (index,val) in names.enumerated(){
    print(val + " at index \(index)")
}

let num = array.remove(at: 3)
_ = array.remove(at: 2)












