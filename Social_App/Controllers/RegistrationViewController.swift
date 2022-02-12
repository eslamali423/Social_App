//
//  RegistrationViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 10/02/2022.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.delegate = self
        lastNameField.delegate = self
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        confirmPasswordField.delegate = self
    }
    
    // Next responder
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstNameField {
            lastNameField.becomeFirstResponder()
        }else if textField == lastNameField{
            usernameField.becomeFirstResponder()
        }else if textField == usernameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        }else if textField == passwordField {
            confirmPasswordField.becomeFirstResponder()
        }
    return true
    }
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
    // Dismiss the keyboard
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        confirmPasswordField.resignFirstResponder()
    
        
    // get & check values in fields
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let username = usernameField.text, !username.isEmpty,
              let firstname =  firstNameField.text, !firstname.isEmpty,
              let lastName =  lastNameField.text, !lastName.isEmpty,
              let confirmPassword = confirmPasswordField.text, !confirmPassword.isEmpty, confirmPassword == password else {
            
            //  Wrong In getting  Values
            return
        }
       // get value successfully
        // registration functionality
        AuthManager.shared.Registration(username: username, email: email, Password: password) { isCreated in
            if isCreated {
                // inseert to databse
                DatabaseManager.shared.insertNewUser(firstName: firstname, lastName: lastName, email: email, username: username ) { isInserted in
                    if isInserted {
                        print("user inserted in database successfully")
                    }else {
                        print("user NOT inserted in database successfully")
                    }
                
                }
                print ("done")
            }
            else {
                print("not done ")
            }
        }
        
    }
 
}



