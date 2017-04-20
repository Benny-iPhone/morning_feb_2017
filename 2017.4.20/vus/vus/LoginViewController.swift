//
//  LoginViewController.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class LoginViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.becomeFirstResponder()
        editingChangedAction(nameTextField)
    }

    @IBAction func editingChangedAction(_ sender: UITextField) {
        let text = sender.text ?? ""
        button.isEnabled = text.characters.count >= 2
    }
    
    @IBAction func tapAction(_ sender: Any) {
        nameTextField.resignFirstResponder()
    }
    
    @IBAction func selectImageAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func startAction(_ sender: Any) {
        
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            if let error = error{
                print(error)
                return
            }
            
            let request = user?.profileChangeRequest()
            request?.displayName = self.nameTextField.text

            request?.commitChanges(completion: { _ in
                FlowController.shared.determineRoot()
            })

            
            guard let image = self.imageView.image,
                let data = UIImageJPEGRepresentation(image, 0.3) else{
                    return
            }
            
            FIRStorage.storage().reference().child("users/" + user!.uid + ".jpg").put(data, metadata: nil, completion: { (metadata, error) in
                
                guard let metadata = metadata else{
                    return
                }
                
                let updateRequest = user?.profileChangeRequest()
                updateRequest?.photoURL = metadata.downloadURL()
                request?.commitChanges(completion: nil)
                
            })
            
            
        })
        
    }
    

}

extension LoginViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}













