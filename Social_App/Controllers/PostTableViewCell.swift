//
//  PostTableViewCell.swift
//  Social_App
//
//  Created by Eslam Ali  on 15/02/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var likesCountLable: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var thimpnailImage: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeButton(_ sender: Any) {
    }
    
    @IBAction func commentButton(_ sender: Any) {
    }
    
    public func setUpPost ( with model : UserPost ) {
        
        let url = model.thumbnilImage
        
    }
}
