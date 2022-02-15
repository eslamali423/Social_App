//
//  ModelsManager.swift
//  Social_App
//
//  Created by Eslam Ali  on 15/02/2022.
//

import Foundation

public struct UserPost {
    let thumbnilImage : URL
    let username :  String
    let postImage: URL
    let caption : String?
    let likesCount : Int
    let comments :  [PostComment]
    let postDate : Date

}

public struct PostComment {
    let username : String
    let text : String
    let commentDate :  Date
}

public struct User {
     let username : String
    let bio : String
    let name : (firstName :  String, lastName :  String)
    let counts : [UserCounts]
}


public struct UserCounts {
    let follower :  Int
    let following  : Int
    let post :  Int
}
