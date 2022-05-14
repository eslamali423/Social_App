//
//  CameraViewController.swift
//  Social_App
//
//  Created by Eslam Ali  on 09/02/2022.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    func didTapAdd () {
    
    // open camera
    let actionAlert =  UIAlertController(title: "change Profile Picture", message: "", preferredStyle: .actionSheet)
    actionAlert.addAction(UIAlertAction(title: "Open Camera", style: .default, handler: { (handler) in
    
    }))
    
    // open camera roll
    actionAlert.addAction(UIAlertAction(title: "Choose From Camera Roll", style: .default, handler: { (handler) in
       
        
    
        
        
    }))
    // to cancel
    actionAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (handler) in
       return
    }))
    
    self.present(actionAlert, animated: true, completion: nil)
    
    }

}
