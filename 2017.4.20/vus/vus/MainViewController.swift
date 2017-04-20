//
//  MainViewController.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tableArray : [Room] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Welcome " + DBManager.manager.username
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
        
        DBManager.manager.observeRooms { room in
            
            self.tableArray.insert(room, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    func addAction(){
        let alert = UIAlertController(title: "Add Room", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { _ in
            
            guard let name = alert.textFields?.first?.text, !name.isEmpty else{
                return
            }
            
            DBManager.manager.createRoom(with: name)
            
        }))
        
        present(alert, animated: true, completion: nil)
    }

    //MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableArray[indexPath.row].name
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let indexPath = tableView.indexPathForSelectedRow,
            let nextVC = segue.destination as? ChatViewController{
            
            nextVC.room = tableArray[indexPath.row]
        }
        
        
    }
    

}












