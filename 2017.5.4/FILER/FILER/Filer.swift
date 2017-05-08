//
//  Filer.swift
//  FILER
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class Filer: NSObject {
    
    static let shared = Filer()
    
    let documentsDir : String
    
    override init() {
        documentsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        super.init()
        
        debugPrint(documentsDir)
    }
    
    func save(data : Data, name : String, ext : String){
        let path = documentsDir + "/" + name + "." + ext
        let url = URL(fileURLWithPath: path)
        
        try? data.write(to: url)
    }
    
    func readData(by name : String, ext : String) -> Data?
    {
        let path = documentsDir + "/" + name + "." + ext
        let url = URL(fileURLWithPath: path)
        
        do{
            return try Data(contentsOf: url)
        } catch {
            debugPrint(error)
            return nil
        }
        
        //return try? Data(contentsOf: url)
    }
    
    func removeData(by name : String, ext : String){
        let path = documentsDir + "/" + name + "." + ext
        
        let manager = FileManager.default
        guard manager.fileExists(atPath: path) else{
            return
        }
        
        try? manager.removeItem(atPath: path)
    }
    
}























