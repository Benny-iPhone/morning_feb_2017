//
//  Utils.swift
//  PhoneValidation
//
//  Created by Benny Davidovitz on 20/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import Foundation
import libPhoneNumber_iOS

extension String{
    
    var isValidPhone : Bool{
        get{
            let phoneUtil = NBPhoneNumberUtil()
            do {
                let number = try phoneUtil.parse(self, defaultRegion: "IL")
                return phoneUtil.isValidNumber(number)
                
            } catch let err as NSError{
                print(err)
                return false
            }
        }
    }
    
    func formattedPhone() -> String?{
        let phoneUtil = NBPhoneNumberUtil()
        do {
            let number = try phoneUtil.parse(self, defaultRegion: "IL")
            let str = try phoneUtil.format(number, numberFormat: .NATIONAL)
            
            return str
        } catch let err as NSError{
            print(err)
            return nil
        }
    }
    
}










