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
        
            // to sign out
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch {
          print("Error signing out")
        }
        // going to Login View Controller
        let LoginVC = storyboard?.instantiateViewController(identifier: "LoginID") as! LoginViewController
        LoginVC.modalPresentationStyle =  .fullScreen
        present(LoginVC, animated: false)
        // going to the HomeVC not to the settingsVCn when you login again
        // NOT WORKING :""""DDDDD
        navigationController?.popToRootViewController(animated: false)
        tabBarController?.selectedIndex = 0
        
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
