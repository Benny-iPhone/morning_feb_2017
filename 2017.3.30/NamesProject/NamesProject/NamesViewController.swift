//
//  NamesViewController.swift
//  NamesProject
//
//  Created by Benny Davidovitz on 30/03/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class NamesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    var tableArray : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editDoneAction))
        navigationItem.leftBarButtonItem = button
    }
    
    func editDoneAction(){
        let editing = !tableView.isEditing
        tableView.isEditing = editing
        let button = UIBarButtonItem(barButtonSystemItem: editing ? .done : .edit, target: self, action: #selector(editDoneAction))
        navigationItem.leftBarButtonItem = button
    }

    @IBAction func addAction(_ sender: Any) {
        let alert = UIAlertController(title: "Add", message: nil, preferredStyle: .alert)
        alert.addTextField {
            $0.placeholder = "type name"
        }
        
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { (_) in
            
            guard let name = alert.textFields?.first?.text, !name.isEmpty else{
                return
            }
            
            let row = self.tableArray.count
            self.tableArray.append(name)
            
            let indexPath = IndexPath(row: row, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .right)
            //self.tableView.reloadData()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - UITableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NameCell
        
        cell.configure(with: tableArray[indexPath.row])
        //cell.textLabel?.text = tableArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            //remove from data
            tableArray.remove(at: indexPath.row)
            //remove form ui
            tableView.deleteRows(at: [indexPath], with: .left)
        default:
            break
        }
        
    }
    
    

}










