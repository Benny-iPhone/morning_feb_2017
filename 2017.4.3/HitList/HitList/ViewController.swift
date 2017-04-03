//
//  ViewController.swift
//  HitList
//
//  Created by hackeru on 03/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    var controller : NSFetchedResultsController<Person>
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        controller = Person.fetchPeople()
        
        super.init(coder: aDecoder)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        controller.delegate = self
        
        let documentsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        debugPrint(documentsDir[0])
        
//        let telAviv = City()
//        telAviv.name = "Tel Aviv"
//        
//        let person = Person()
//        person.city = telAviv
        
    }

    @IBAction func addAction(_ sender: Any) {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        
        func handler(_ action : UIAlertAction){
            guard let first = alert.textFields?.first?.text,
                let last = alert.textFields?.last?.text,
                !(first.isEmpty && last.isEmpty)
            else {
                return
            }
            
            let context = DBManager.manager.context
            let newPerson = Person(context: context)
            newPerson.firstname = first
            newPerson.lastname = last
            newPerson.isAlive = true
            newPerson.date = NSDate()
            
            DBManager.manager.saveContext()
        }
        
        alert.addTextField {
            $0.placeholder = "first name"
        }
        
        alert.addTextField {
            $0.placeholder = "last name"
        }
        
        alert.addAction(UIAlertAction(title: "Later", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .destructive, handler: handler))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }


    //MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return controller.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let info = controller.sections![section]
        return info.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonCell
        cell.delegate = self
        
        let p = controller.object(at: indexPath)
        cell.configure(with: p)
        //cell.textLabel?.text = p.firstname
        //cell.detailTextLabel?.text = p.lastname
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let info = controller.sections![section]
        return info.name
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        
        controller.object(at: indexPath).removeFromDB()
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return controller.sectionIndexTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Moon Door"
    }
    
    
    
    
}

//MARK: - PersonCell Delegate

extension ViewController : PersonCellDelegate{
    func personCell(_ cell: PersonCell, didChangeIsAlive isAlive: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else{
            return
        }
        
        let person = controller.object(at: indexPath)
        
        person.isAlive = isAlive
        
        DBManager.manager.saveContext()
    }
    
    func personCellImageDidTap(_ cell: PersonCell) {
        
        guard let indexPath = tableView.indexPath(for: cell) else{
            return
        }
        
        let person = controller.object(at: indexPath)
        
        let picker = AppImagePickerController()
        picker.info = person
        picker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        self.present(picker, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerController Delegate
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let appPicker = picker as? AppImagePickerController,
            let person = appPicker.info as? Person else{
                return
        }
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            person.setImage(image)
        }

        
    }
    
}

//MARK: - UISearchBar Delegate

extension ViewController : UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        controller = Person.fetchPeople()
        tableView.reloadData()
        controller.delegate = self
        
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        controller = Person.fetchPeople(searchText)
        tableView.reloadData()
        controller.delegate = self
        
    }
    
}

//MARK: - NSFetchedResultsController Delegate

extension ViewController : NSFetchedResultsControllerDelegate{
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {

        let indexSet = IndexSet(integer: sectionIndex)
        
        switch type {
        case .insert:
            
            tableView.insertSections(indexSet, with: .fade)
            
        case .delete:
            
            tableView.deleteSections(indexSet, with: .fade)
            
        default:
            return
        }
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        default:
            return
        }
        
    }
    
}



















