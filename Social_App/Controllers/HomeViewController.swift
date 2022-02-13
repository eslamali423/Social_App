//
//  HomeViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit
import FirebaseAuth
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HandleAuthentcation()
       
    }
    
   
  // check if user loged in or not
    private func HandleAuthentcation () {
        if Auth.auth().currentUser == nil {
            // show login view
            let LoginVC = storyboard?.instantiateViewController(identifier: "LoginID") as! LoginViewController
            LoginVC.modalPresentationStyle =  .fullScreen
            present(LoginVC, animated: false)
        }
    }
    
    @IBAction func signout(_ sender: Any) {
       
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch {
          print("Error signing out: %@")
        }
    }
}



    
