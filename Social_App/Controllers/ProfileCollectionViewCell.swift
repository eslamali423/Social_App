//
//  ProfileCollectionViewCell.swift
//  Social_App
//
//  Created by Eslam Ali  on 13/02/2022.
//

import UIKit
import SDWebImage
public class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    private var model = [UserPost]()
 
    public func setUpUserPost(with model :  UserPost){
        let url = model.postImage
        self.image.sd_setImage(with: url, completed: nil)
      //  self.image.image =  UIImage(named: "eslam_img")
    }
    
}









