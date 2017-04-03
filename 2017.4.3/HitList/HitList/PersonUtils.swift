//
//  PersonUtils.swift
//  HitList
//
//  Created by hackeru on 03/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension NSManagedObject{
    func removeFromDB(){
        DBManager.manager.context.delete(self)
        DBManager.manager.saveContext()
    }
}

extension NSString{
    func firstChar() -> String{
        if self.length == 0{
            return ""
        }
        return self.substring(to: 1)
    }
}



extension Person{
    
    func setImage(_ image : UIImage){
        //save new
        let filename = NSUUID().uuidString
        guard let data = UIImageJPEGRepresentation(image, 0.3) else{
            return
        }
        
        _ = Filer.filer.write(data:data, filename: filename, fileExt: "jpeg")
        
        //remove old
        if let oldName = self.imageName{
            _ = Filer.filer.remove(filename: oldName, fileExt: "jpeg")
        }
        
        //udpate
        self.imageName = filename
        DBManager.manager.saveContext()
    }
    
    override func removeFromDB() {
        //remove old
        if let name = self.imageName{
            _ = Filer.filer.remove(filename: name, fileExt: "jpeg")
        }
        
        //do super stuff
        super.removeFromDB()
    }
    
    
    class func fetchPeople(_ term : String = "") -> NSFetchedResultsController<Person>
    {
        let request : NSFetchRequest<Person> = Person.fetchRequest()
    
        
        request.sortDescriptors = [
            NSSortDescriptor(key: "lastname.firstChar", ascending: true),
            NSSortDescriptor(key: "lastname", ascending: true),
            NSSortDescriptor(key: "firstname", ascending: true)
        ]
        
        if term.isEmpty == false{
            
            request.predicate = NSPredicate(format: "firstname CONTAINS[cd] %@ OR lastname CONTAINS[cd] %@",term,term)
            
        }
        
        let context = DBManager.manager.context
        
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: "lastname.firstChar", cacheName: nil)
        
        do{
            try controller.performFetch()
        } catch {
            print(error)
        }
        
        return controller
    }
    
}









