//
//  ViewController.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    var names : [String] = []
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DBManager.manager.readAllBranches { (name) in
            self.names.insert(name, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }

    @IBAction func addAction(_ sender: Any) {
        
        //DBManager.manager.branchesRef.child("-Ki9AKjfzRMh--BomuMz").setValue(nil)
        //DBManager.manager.branchesRef.child("-Ki9AKjfzRMh--BomuMz").removeValue()
        //DBManager.manager.branchesRef.child("-Ki98ES2DNNrEPy6rqgP").child("name").setValue("test2")
        
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        guard let phone = phoneTextField.text, !phone.isEmpty else {
            return
        }
        
        DBManager.manager.addBranch(name: name, lat: 30, lon: 30, phone: phone)
        
        nameTextField.text = nil
        phoneTextField.text = nil
        
        
        
    }
    
    //MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }

}













