//
//  Model.swift
//  DateConvertor
//
//  Created by Benny Davidovitz on 27/02/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import Foundation

enum ConvertType : Int{
    case gregToHeb = 0
    case hebToGreg //1
    
    func sourceCalendar() -> Calendar{
        switch self {
        case .gregToHeb:
            return Calendar(identifier: .gregorian)
        case .hebToGreg:
            return Calendar(identifier: .hebrew)
        }
    }
    
    func destinationCalendar() -> Calendar{
        switch self {
        case .gregToHeb:
            return Calendar(identifier: .hebrew)
        case .hebToGreg:
            return Calendar(identifier: .gregorian)
        }
    }
    
    func sourceLocale() -> Locale{
        switch self {
        case .gregToHeb:
            return Locale(identifier: "en")
        case .hebToGreg:
            return Locale(identifier: "he")
        }
    }
    
    func destinationLocale() -> Locale{
        switch self {
        case .gregToHeb:
            return Locale(identifier: "he")
        case .hebToGreg:
            return Locale(identifier: "en")
        }
    }
    
    
    
}






































