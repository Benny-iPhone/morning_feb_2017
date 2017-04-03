//
//  ViewController.swift
//  HitList
//
//  Created by hackeru on 03/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let context = DBManager.manager.context
        let newPerson = Person(context: context)
        newPerson.firstname = "The"
        newPerson.lastname = "Hound"
        newPerson.date = NSDate()
        
        DBManager.manager.saveContext()
        
        let documentsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        debugPrint(documentsDir[0])
        
//        let telAviv = City()
//        telAviv.name = "Tel Aviv"
//        
//        let person = Person()
//        person.city = telAviv
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

