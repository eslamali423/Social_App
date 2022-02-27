//
//  ProfileViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
  
    
   
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UIStackView!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var followingsStackView: UIStackView!
    @IBOutlet weak var followersStackView: UIStackView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var postsStackView: UIStackView!
    
  //  var userPosts = [UserPost]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//setting item to navigation bar
        setItemToNavigationBar()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        profilePicture.layer.cornerRadius = profilePicture.frame.size.height / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (view.frame.width - 4 ) / 3, height: (view.frame.width - 4 ) / 3)
        collectionView.collectionViewLayout = layout
        
       
        // set profile image form userdefualts
        
        guard let urlString = UserDefaults.standard.value(forKey: "profileImageURL") as? String ,
              let url =  URL(string: urlString ) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data =  data , error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.profilePicture.image = UIImage(data: data)
                guard  let urlString  = UserDefaults.standard.value(forKey: "profileImageURL") as? URL else {
                return
                }
                
                }
            }
           
            
        
        task .resume()
    }
    
    @objc func pressFollowers() {
        print("followers pressed")
    }
    
    //collectionView 4 functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return userPosts.count
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
//        let model = userPosts[indexPath.row]
//        cell.setUpUserPost(with: model)
      cell.image.image = UIImage(named: "eslam_img")
        return cell
    }
    
    
    // press on Post
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // get the model and open the post Controller
//        let model = userPosts[indexPath.row]
        // we need to pass the model to postViewController (how)
        let postVC = storyboard?.instantiateViewController(identifier: "postID") as! PostViewController
     //   postVC.setUpPost(model: model)
        postVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    
    // confgure navogation Item
    func  setItemToNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done , target: self, action: #selector(goToSettingsVC))
        
    }
    // setting Button
    @objc func goToSettingsVC() {
        let settingsVC = storyboard?.instantiateViewController(identifier: "settingVCID") as! SettingsViewController
      
        settingsVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    public func setUpUser(model : User){
    }

    
}
