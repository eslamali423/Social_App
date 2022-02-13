//
//  StorageManager.swift
//  Social_App
//
//  Created by Eslam Ali  on 13/02/2022.
//

import Foundation
import FirebaseStorage

public class StorageManager {
    
   static let shared  =  StorageManager()
    let bucket  =  Storage.storage().reference()

    public func uploadImage (){
        
    }
    public func downloadImage (with referance : String, completion: @escaping (Result<URL,storageManagerError>)->Void){
        bucket.child(referance).downloadURL { (url, error) in
            guard let url = url , error == nil else {
                //failed to download image
                completion(.failure(.donwloadImageError))
                return
            }
            completion(.success(url))
            //success to download image
            
        }
        
    }
    
    public enum storageManagerError : Error {
        case  donwloadImageError
    }
    
}
