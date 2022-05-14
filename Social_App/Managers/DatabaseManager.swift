//
//  DatabaseManager.swift
//  Social_App
//
//  Created by Eslam Ali  on 12/02/2022.
//

import FirebaseDatabase
import FirebaseAuth

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    let  database = Database.database().reference()
    
 //   let key =  Auth.auth().currentUser?.uid
    // check if username and email are availble
    public func canCreateNewUser (username:  String, email: String, complition: (Bool) -> Void){
        
        complition(true)
    }
    
    // to Insert User data in Database
    public func insertNewUser (firstName : String, lastName: String, email: String,username:String, completion : @escaping (Bool)-> Void){
    let safeKey = DatabaseManager().generateSafeKey(email:UserDefaults.standard.object(forKey: "safeKey") as! String)
        database.child(safeKey).setValue(["firstName": firstName, "lastName": lastName, "email": email, "username": username, "following" : 0, "followers" : 0]){ error , _ in
            if error == nil {
                // Success
                print("user Iserted in database ......")
                completion(true)
                return
            } else {
                // Failed
                completion(false)
                return
            }
        }
        
        
    }
    
    public func generateSafeKey(email : String) -> String {
        let newString = email.replacingOccurrences(of: ".", with: "-", options: .literal, range: nil).replacingOccurrences(of: "@", with: "-", options: .literal, range: nil)

        return newString
    }
    
}//class DatabaseManger
