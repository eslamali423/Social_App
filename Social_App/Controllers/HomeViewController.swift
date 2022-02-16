//
//  HomeViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit
import FirebaseAuth
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HandleAuthentcation()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Social App"
         
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.postImage.image = UIImage(named: "eslam_img")
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
   
  // check if user loged in or not
    private func HandleAuthentcation () {
        if Auth.auth().currentUser == nil {
            // show login view
            let LoginVC = storyboard?.instantiateViewController(identifier: "LoginID") as! LoginViewController
            LoginVC.modalPresentationStyle =  .fullScreen
            present(LoginVC, animated: false)
        }
    }
    
 
}



    
