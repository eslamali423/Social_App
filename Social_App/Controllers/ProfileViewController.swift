//
//  ProfileViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setItem()
    }
 
    
    func  setItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done , target: self, action: #selector(goToSettingsVC))
    }
    
    @objc func goToSettingsVC() {
        let settingsVC = storyboard?.instantiateViewController(identifier: "settingVCID") as! SettingsViewController
        
        present(settingsVC, animated: true, completion: nil)
    }
    
}
