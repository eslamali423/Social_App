
import UIKit
import FirebaseAuth
import SafariServices

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var tabelView: UITableView!

    var data = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        title = "Settings"

        //set title for the settings
        data.append(["Edit Profile", "Invite Friends", "Save Original Posts"])
        data.append(["Terms Of Service", "Privacy Policy", "Help / Feedback"])
        data.append(["Log Out"])
        
            }
    // table view 4 function
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let secData = data[indexPath.section][indexPath.row]
        cell.textLabel?.text =  secData
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    
    // Action when select on setting View Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2,indexPath.row == 0/* LOG OUT */ {
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
        } else if indexPath.section == 1,indexPath.row == 0 /* TERMS OF SERVICE */ {
            guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
            }
            let termsVC =  SFSafariViewController(url: url)
            present(termsVC, animated: true)
        } else if indexPath.section == 1,indexPath.row == 1 /* PRIVECY POLICY */ {
            guard  let url = URL(string: "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0") else {
                return
            }
            let privacyVC = SFSafariViewController(url: url)
            present(privacyVC, animated: true, completion: nil)
        } else if indexPath.section == 1,indexPath.row == 2 /* HELP / FEEDBACK */ {
            guard  let url = URL(string: "https://help.instagram.com") else {
                return
            }
            let helpsVC = SFSafariViewController(url: url)
            present(helpsVC, animated: true, completion: nil)
        } else if indexPath.section == 0,indexPath.row == 0 {
            let editprofileVC = storyboard?.instantiateViewController(identifier: "editProfileID") as! EditProfileViewController
          
            editprofileVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(editprofileVC, animated: true)
        }
    
        
    
        
    
    }//func
    
        
    
    

}
