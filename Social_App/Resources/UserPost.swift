//
//  UserPost.swift
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
