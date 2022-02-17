//
//  PostViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 17/02/2022.
//

import UIKit
import SDWebImage
class PostViewController: UIViewController {

    @IBOutlet weak var PostImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var thampnilImage: UIImageView!
    
    private let model : UserPost? = nil
    
    public func setUpPost (model : UserPost)
    {
        let thimpnilUrl = model.thumbnilImage
        let postImageUrl =  model.postImage
        self.thampnilImage.sd_setImage(with: thimpnilUrl, completed: nil)
        self.PostImage.sd_setImage(with: postImageUrl, completed: nil)
   //     self.PostImage.image = UIImage(named: "eslam_img")
        
    }
    
  
  
    
    
    // setUp post Data after w get Post Model
    public func setUpPost(with model : UserPost){
        let thampnailUrl = model.thumbnilImage
        let postImageUrl = model.postImage
        self.PostImage.sd_setImage(with: thampnailUrl, completed: nil)
        self.PostImage.sd_setImage(with: postImageUrl, completed: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
