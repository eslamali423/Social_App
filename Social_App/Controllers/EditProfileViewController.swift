//
//  EditProfileViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 13/02/2022.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage



class EditProfileViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
   
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    var imagePicker : UIImagePickerController!
   
    let safeKey = DatabaseManager().generateSafeKey(email:UserDefaults.standard.object(forKey: "safeKey") as! String)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing =  true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        title = "Edit Profile"
        setItemToNavigationController()
        

        
       
        //get the key form USER DEFAULTS

        // going to the database to get data
        let emailvalue =  Database.database().reference().child(self.safeKey).child("email")
        emailvalue.observeSingleEvent(of: .value) { snapshot in
            self.emailField.text = snapshot.value as! String

        }
        let usernameValue =  Database.database().reference().child(self.safeKey).child("username")
        usernameValue.observeSingleEvent(of: .value) { snapshot in
            self.usernameField.text = snapshot.value as! String
            
        }
        let firstNameValue =  Database.database().reference().child(self.safeKey).child("firstName")
        firstNameValue.observeSingleEvent(of: .value) { snapshot in
            self.firstNameField.text = snapshot.value as! String
           
        }
        let lastnameValue =  Database.database().reference().child(self.safeKey).child("lastName")
        lastnameValue.observeSingleEvent(of: .value) { snapshot in
            self.lastNameField.text = snapshot.value as! String
          
        }
   
    }
    
    @IBAction func changeProfilePicture(_ sender: Any) {
        // open camera
        let actionAlert =  UIAlertController(title: "change Profile Picture", message: "", preferredStyle: .actionSheet)
        actionAlert.addAction(UIAlertAction(title: "Open Camera", style: .default, handler: { (handler) in
        
        }))
        
        // open camera roll
        actionAlert.addAction(UIAlertAction(title: "Choose From Camera Roll", style: .default, handler: { (handler) in
            self.present(self.imagePicker, animated: true, completion: nil)
            // uploade image to firebase storage
            
          //  storageRef.putData(Data, metadata: , completion: <#T##((StorageMetadata?, Error?) -> Void)?##((StorageMetadata?, Error?) -> Void)?##(StorageMetadata?, Error?) -> Void#>)
            
            
            
        }))
        // to cancel
        actionAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (handler) in
           return
        }))
        
        self.present(actionAlert, animated: true, completion: nil)
        
    }
    
    // set save button to navigation controller
    func setItemToNavigationController (){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButton))

    }
  
   
    
    //save button function
    @objc func saveButton(){
        guard let username =  usernameField.text, !username.isEmpty,
              let firstname =  firstNameField.text, !firstname.isEmpty,
              let lastname = lastNameField.text, !lastname.isEmpty,
              let email = emailField.text , !email.isEmpty else {
            //faild
            return
        }
        // success geting data
        // insert new data in the database
        DatabaseManager.shared.insertNewUser(firstName: firstname, lastName: lastname, email: email, username: username) { (isInserted) in
            if isInserted {
                print("data updated successfully")
                self.dismiss(animated: true, completion: nil)
            }else {
                print("error updating data ")
            }
        }
     
    }
    }
  
    // upload image to firebase storage func
    func uploadImageToFirebaseStorage(image : UIImage){
        let storageRef = Storage.storage().reference().child("myImage")
       let data = Data()
        
        let uploadTask = storageRef.putData(data, metadata: nil) { (metaData, error) in
            guard let metaData = metaData else {
                // something went worng
                return
            }
            let size = metaData.size
            storageRef.downloadURL { (url, error) in
             
                guard let downloadedURL = url else {
                    return
                }
                print("downloaded URL :::::: \(downloadedURL)")
            }
        }
    }
    
    
      // to hide the keyboard when you finish editing
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    



extension EditProfileViewController: UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil )
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let  pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImage.image = pickedImage
            // upload image to firebase
            uploadImageToFirebaseStorage(image: pickedImage)
            

            
            
        }
        picker.dismiss(animated: true, completion: nil)

    }
    
}

