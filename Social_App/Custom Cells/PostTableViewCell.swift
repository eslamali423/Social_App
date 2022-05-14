//
//  PostTableViewCell.swift
//  Social_App
//
//  Created by Eslam Ali  on 15/02/2022.
//

import UIKit
import SDWebImage

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var likesCountLable: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var thimpnailImage: UIImageView!
   
    private var model : UserPost?
    
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    
    public func configure() {
        // configire the cell 
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeButton(_ sender: Any) {
    }
    
    @IBAction func commentButton(_ sender: Any) {
    }
    
    // Passing UserPost to fill data 
    public func setUpProfilePicture ( with model : UserPost ) {
        
        let url = model.thumbnilImage
        self.thimpnailImage.sd_setImage(with: url, completed: nil)
        
    }
}
