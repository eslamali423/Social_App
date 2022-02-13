//
//  SettingsViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 12/02/2022.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabelView.delegate = self
        tabelView.dataSource = self
        navigationController?.title = "Settings"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text =  "Sign Out"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let actionAlert = UIAlertController(title: "Sign Out", message: "Sure you want to Sign out? ", preferredStyle: .actionSheet)
        actionAlert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (action) in
            // to sign out
            AuthManager.shared.signOut { (success) in
                if success {
                    let LoginVC = self.storyboard?.instantiateViewController(identifier: "LoginID") as! LoginViewController
                    LoginVC.modalPresentationStyle =  .fullScreen
                    self.present(LoginVC, animated: false)
                    // going to the HomeVC not to the settingsVCn when you login again
                    // NOT WORKING :""""DDDDD
                    self.navigationController?.popToRootViewController(animated: false)
                    self.tabBarController?.selectedIndex = 0
                }
            }
        
        }))
        present(actionAlert, animated: true, completion: nil)
        }
        
    
    

}
