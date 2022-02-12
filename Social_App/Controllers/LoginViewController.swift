//
//  LoginViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate =  self
        passwordField.delegate = self
        
        
        emailField.returnKeyType = .next
        passwordField.returnKeyType = .continue

    }
   // LOGIN BUTTON ACTION
    @IBAction func loginButton(_ sender: Any) {
         print ("login button ")
        //removing the highlight from a selection.
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        // validation
        guard  let email = emailField.text, !email.isEmpty,
               let password = passwordField.text, !password.isEmpty  else  {
            print ("something wrong...")
            return
        }
        // Login Functionaliy
        AuthManager.shared.Login(email: email, password: password) { (success) in
            // dispacthqueue -> make it background thread to make it faster
            DispatchQueue.main.async {
                if success {
                    // user signed in
                    print ("you are loged in ")
                    //to dismiss login view controller and move to home
                    self.dismiss(animated: false, completion:nil )
                    
                }else {
                    //user Not signed in
                    print ("you are NOT loged in ")
                    let alert = UIAlertController(title: "Login Error", message: "SOMEYHING WRONG YOU'RE NOT LOGED IN.", preferredStyle: .alert )
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { (action) in
                        print("dismiss pressed")
                    }))
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
            
           
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField{
            
            passwordField.becomeFirstResponder()
        } else if textField ==  passwordField {
            
        }
    return true
    }
    }
    
        
        
    @IBAction func privacyPolicyButton(_ sender: Any) {
        guard let url = URL(string: "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0") else {
            return
        }
        let privacyVC = SFSafariViewController(url: url)
        present(privacyVC, animated: true)
    }
    @IBAction func termsOfServiceButton(_ sender: Any) {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
        return
        }
        let termsVC =  SFSafariViewController(url: url)
        present(termsVC, animated: true)
        
    }
    
    
    @IBAction func createNewAccountButton(_ sender: Any) {
        let RegistraionVC = storyboard?.instantiateViewController(identifier: "registrationID") as! RegistrationViewController
        RegistraionVC.title = "Create Account"
        // RegistraionVC.modalPresentationStyle = .fullScreen
        present(UINavigationController(rootViewController: RegistraionVC), animated: true)
    }
    
}
