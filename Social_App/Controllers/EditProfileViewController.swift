//
//  EditProfileViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 13/02/2022.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile"
        
        setItemToNavigationController()
        
    }
    
    // set save button to navigation controller
    func setItemToNavigationController (){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButton))
    }
    
    @objc func saveButton(){
        // get new data and store it in the database
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
