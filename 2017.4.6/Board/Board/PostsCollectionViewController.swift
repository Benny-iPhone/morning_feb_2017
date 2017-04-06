//
//  PostsCollectionViewController.swift
//  Board
//
//  Created by hackeru on 06/04/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class PostsCollectionViewController: UICollectionViewController {

    var collectionArray : [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DBManager.manager.newPostObserve {
            self.collectionArray.insert($0, at: 0)
            let indexPath = IndexPath(item: 0, section: 0)
            self.collectionView?.insertItems(at: [indexPath])
        }
    }
    
    deinit {
        DBManager.manager.postRef.removeAllObservers()
    }

    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Post", message: nil, preferredStyle: .alert)
        
        alert.addTextField { $0.placeholder = "your text" }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { _ in
            guard let text = alert.textFields?.first?.text, !text.isEmpty else{
                return
            }
            
            DBManager.manager.createPost(with: text)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostCell
    
        // Configure the cell
        cell.configure(with: collectionArray[indexPath.item])
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
