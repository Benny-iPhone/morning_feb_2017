//
//  Filer.swift
//  ActionSheet
//
//  Created by hackeru on 23/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class Filer: NSObject {
    static let filer = Filer()
    
    var documentdDir : String
    
    override init() {
        documentdDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        super.init()
    }
    
    func write(data : Data, filename : String, fileExt : String) -> Bool{
        guard !filename.isEmpty , !fileExt.isEmpty else {
            return false
        }
        
        let path = documentdDir + "/" + filename + "." + fileExt
        
        debugPrint(path)
        
        let url = URL(fileURLWithPath: path)
        do{
            try data.write(to: url)
            return true
        } catch {
            print(error)
            return false
        }
        
    }
    
    func read(filename : String, fileExt : String) -> Data?{
        let path = documentdDir + "/" + filename + "." + fileExt
        let url = URL(fileURLWithPath: path)
        
        return try? Data(contentsOf: url)
    }
    
    func remove(filename : String, fileExt : String) -> Bool{
        let path = documentdDir + "/" + filename + "." + fileExt
        let url = URL(fileURLWithPath: path)
        
        if FileManager.default.fileExists(atPath: path){
            do{
                try FileManager.default.removeItem(at: url)
                return true
            } catch {
                print(error)
                return false
            }
        } else {
            return false
        }
    }
 
}











