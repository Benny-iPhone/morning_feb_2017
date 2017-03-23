//
//  ViewController.swift
//  ActionSheet
//
//  Created by hackeru on 23/03/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let filename = UserDefaults.standard.value(forKey: "filename") as? String else {
            return
        }
        
        guard let data = Filer.filer.read(filename: filename, fileExt: "png") else{
            return
        }
        
        let image = UIImage(data: data)
        imageView.image = image
    }
    
    
    @IBAction func tapAction(_ sender: Any) {
        
        let sheet = UIAlertController(title: "Media", message: "Select Source", preferredStyle: .actionSheet)
        
        func handler(_ action : UIAlertAction){
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.mediaTypes = [kUTTypeImage as String]

            let title = action.title ?? ""
            
            switch title {
            case "library":
                picker.sourceType = .photoLibrary
            case "Rear Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .rear
                picker.showsCameraControls = true
            case "Selfie Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .front
                picker.showsCameraControls = true
            default:
                return
            }
            
            self.present(picker, animated: true, completion: nil)
            
        }
        
        let libraryAction = UIAlertAction(title: "library", style: .destructive, handler: handler)
        libraryAction.image = #imageLiteral(resourceName: "icon_photo_album")
        //libraryAction.setValue(#imageLiteral(resourceName: "icon_photo_album"), forKey: "image")
        sheet.addAction(libraryAction)
        
        if UIImagePickerController.isCameraDeviceAvailable(.rear){
        
            sheet.addAction(UIAlertAction(title: "Rear Camera", style: .default, image: #imageLiteral(resourceName: "icon_camera"),handler: handler))
        }
        
        if UIImagePickerController.isCameraDeviceAvailable(.front){
            let selfieCameraAction = UIAlertAction(title: "Selfie Camera", style: .default, handler: handler)
            selfieCameraAction.image = #imageLiteral(resourceName: "icon_selfie")
            sheet.addAction(selfieCameraAction)
        }
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //sheet.view.tintColor = .black
        
        present(sheet, animated: true, completion: nil)
        
        
    }
    

}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = (info[UIImagePickerControllerEditedImage] as? UIImage) ?? (info[UIImagePickerControllerOriginalImage] as? UIImage)
        
        picker.dismiss(animated: true) { 
            self.imageView.image = image
        }
        
        DispatchQueue.global().async {
            guard let image = image,
            let data = UIImagePNGRepresentation(image)
            else{
                return
            }
            
            
            if let oldfilename = UserDefaults.standard.value(forKey: "filename") as? String{
                
                _ = Filer.filer.remove(filename: oldfilename, fileExt: "png")
                
            }
            
            let filename = NSUUID().uuidString
            let r = Filer.filer.write(data: data, filename: filename, fileExt: "png")
            print("did save image \(r)")
            
            UserDefaults.standard.set(filename, forKey: "filename")
            UserDefaults.standard.synchronize()
            
            
        }
        
    }
}

extension UIAlertAction{
    @NSManaged var image : UIImage?
    
    convenience init(title: String?, style: UIAlertActionStyle,image : UIImage?, handler: ((UIAlertAction) -> Swift.Void)? = nil ){
        self.init(title: title, style: style, handler: handler)
        self.image = image
    }
}











