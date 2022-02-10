//
//  LoginViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        
    }
    
    @IBAction func createNewAccountButton(_ sender: Any) {
        let RegistraionVC = storyboard?.instantiateViewController(identifier: "registrationID") as! RegistrationViewController
        
        
        RegistraionVC.modalPresentationStyle = .fullScreen
        present(RegistraionVC, animated: false)
    }
    
}
