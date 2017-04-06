//
//  ViewController.swift
//  OMBDAPI
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CCBottomRefreshControl

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    enum `Type` : Int{
        case all
        case movies
        case series
        
        func toString() -> String?{
            switch self {
            case .all: return nil
            case .movies: return "movie"
            case .series: return "series"
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableArray : [OMDBItem] = []
    var term : String = ""
    var page : Int = 1
    var type : Type = .all
    
    weak var refreshControl : UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(control)
        refreshControl = control
        
        let bControl = UIRefreshControl()
        bControl.triggerVerticalOffset = 100
        bControl.addTarget(self, action: #selector(nextPage), for: .valueChanged)
        self.tableView.bottomRefreshControl = bControl
    }
    
    func nextPage(){
        page += 1
        getData()
    }
    
    func refresh(){
        page = 1
        getData()
    }
    
    func getData(){
        
        APIManager.manager.search(term: term, at: page, type: type.toString()) {
            self.refreshControl?.endRefreshing()
            self.tableView.bottomRefreshControl?.endRefreshing()
            
            if self.page == 1{
                self.tableArray = $0
            } else {
                self.tableArray += $0
            }
            
            self.tableView.reloadData()
            
            self.navigationItem.title = $1
        }
    }
    
    //MARK: - IBAction
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        if let t = Type(rawValue: sender.selectedSegmentIndex){
            self.type = t
            refresh()
        }
    }
    
    //MARK: - SearchBar Delegate
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //clear search bar
        searchBar.text = ""
        
        //close keyboard
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        term = searchBar.text ?? ""
        page = 1
        
        getData()
        
        //close keyboard
        searchBar.resignFirstResponder()
    }
    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        
        cell.configure(with: tableArray[indexPath.row])
        //cell.textLabel?.text = tableArray[indexPath.row].title
        
        return cell
        
    }
    
    //MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "detailesSegue",
            let indexPath = tableView.indexPathForSelectedRow
        else {
            return true
        }
        
        if tableArray[indexPath.row] is OMDBDetailedItem{
            return true
        }
        
        APIManager.manager.getDetails(of: tableArray[indexPath.row].imdbID) { (obj, str) in
            if let obj = obj{
                self.tableArray[indexPath.row] = obj
                self.performSegue(withIdentifier: "detailesSegue", sender: sender)
            } else {
                print(str ?? "")
            }
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailesSegue",
            let indexPath = tableView.indexPathForSelectedRow,
            let obj = tableArray[indexPath.row] as? OMDBDetailedItem{
            
            let nextVC = segue.destination as? DetailsViewController
            nextVC?.item = obj
            
        }
    }
    


}













