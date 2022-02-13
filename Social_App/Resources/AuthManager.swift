//
//  AuthManager.swift
//  Social_App
//
//  Created by Eslam Ali  on 10/02/2022.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    public func Registration (username: String, email :String, Password: String, competion : @escaping (Bool) -> Void ){
        DatabaseManager.shared.canCreateNewUser(username: username, email: email) {sucsess in
            if sucsess {
                // you can create new user
                Auth.auth().createUser(withEmail: email, password: Password) { (result, erorr) in
                    if result != nil , erorr == nil {
                        // insert user in database
                        print("user added successfuly")
                        competion(true)
                        return
                    }else {
                    // something worng
                        print("user not added successsfuly")
                        competion(false)
                        return
                }
            }
            }  else {
                competion(false)
            }
        
        }
        
    } //registration func
   
    

    
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
 
    public func signOut (completion : (Bool) -> Void){
            do{
                try Auth.auth().signOut()
                completion(true)
            }
            catch {
            print("Error in sign out")
                completion(false)
            }
 
    }

    
       
        
        
    
    
    
    
}//class
