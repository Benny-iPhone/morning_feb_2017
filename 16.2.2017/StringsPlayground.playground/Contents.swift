//: Playground - noun: a place where people can play

import UIKit

var str : String = "Hello, playground"
str += " what is javA?"

var counter = 0

for ch in str.characters{
    switch ch {
    case "a","e","i","o","u","A","E","I","O","U":
        counter += 1
    default:
        break
    }
}

counter

let str1 = "benny"
str1.uppercased()
str1

str1.characters.count
str1.isEmpty

extension String{
    var isEmail : Bool{
        get{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }
    }
    /*
    func isValidEmail() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
 */
}



let email = "a@a.com"
//email.isValidEmail()
email.isEmail















