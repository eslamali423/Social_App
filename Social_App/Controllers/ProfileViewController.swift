//
//  ProfileViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
  
    
    @IBOutlet weak var follwersLabel: UILabel!
    
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
//setting item to navigation bar
        setItemToNavigationBar()

        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
        
        return cell
    }

    
    
    func  setItemToNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done , target: self, action: #selector(goToSettingsVC))
        
        
    }
    @objc func goToSettingsVC() {
        let settingsVC = storyboard?.instantiateViewController(identifier: "settingVCID") as! SettingsViewController
      
        settingsVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(settingsVC, animated: true)
        //present(settingsVC, animated: true, completion: nil)
    }
    
}
