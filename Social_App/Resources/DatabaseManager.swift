//
//  DatabaseManager.swift
//  Social_App
//
//  Created by Eslam Ali  on 12/02/2022.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    let  database = Database.database().reference()
    
    // check if username and email are availble
    public func canCreateNewUser (username:  String, email: String, complition: (Bool) -> Void){
        
        complition(true)
    }
    
    // to Insert User data in Database
    public func insertNewUser (firstName : String, lastName: String, email: String,username:String, completion : @escaping (Bool)-> Void){
        database.childByAutoId().setValue(["firstName": firstName, "lastName": lastName, "email": email, "username": username]){ error , _ in
            if error == nil {
                // Success
                completion(true)
                return
            } else {
                // Failed
                completion(false)
                return
            }
        }
        
        
    }
    
    
    
}//class DatabaseManger
