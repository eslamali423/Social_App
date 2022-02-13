//
//  NotificationViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
// to set navigartion controller item without set title for the tabBar item
        navigationController?.navigationBar.topItem?.title = "Notification"
/*
        -this code set title for the navigation controller and the tabBar item
        i don't know why :)
       // title = "Notification"
      //  tabBarItem.title = " "  // NOT WORKING
*/
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell") as! notificationTableViewCell
       
        return cell
    }
    
    
    

   

}
