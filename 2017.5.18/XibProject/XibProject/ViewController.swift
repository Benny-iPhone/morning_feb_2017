//
//  ViewController.swift
//  XibProject
//
//  Created by Benny Davidovitz on 18/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(NoDataTableViewCell.nib(), forCellReuseIdentifier: NoDataTableViewCell.reuseIdentifier())
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: NoDataTableViewCell.reuseIdentifier(), for: indexPath)
    }


}

