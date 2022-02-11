//
//  AuthManager.swift
//  Social_App
//
//  Created by Eslam Ali  on 10/02/2022.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    public func Registration (email :String, Password: String, confirmPassword: String){
        
    }
    
    public func Login (email: String, password: String, completion: @escaping ((Bool) -> Void)){
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard authResult != nil , error == nil else {
                // user not signed in
                completion(false)
                return
            }
            // user signed in successfully
            completion(true)
        }
        
    }//login func
    
}//class
