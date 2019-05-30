//
//  HomeViewController.swift
//  project3-tracker
//
//  Created by Tomas Mateo Perotti on 27/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    // MARK: - Properties
    let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NVC") as! UINavigationController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUserAndConfigureView()
    }
    

    @IBAction func btnActionLogOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.present(navController, animated: true, completion: nil)
        } catch let error {
            print("Failed to sign out with error: ", error.localizedDescription)
        }
    }
    
    // MARK: - API
    
    func authenticateUserAndConfigureView() {
        if Auth.auth().currentUser == nil  {
            DispatchQueue.main.async {
                self.present(self.navController, animated: true, completion: nil)
            }
        } else {
            
        }
    }

}
