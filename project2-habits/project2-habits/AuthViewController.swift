//
//  AuthViewController.swift
//  project2-habits
//
//  Created by Tomas Mateo Perotti on 24/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func signIn() {
        // 1
        view.endEditing(true)
        
        // 2
        guard let email = emailField.text, email.count > 0 else {
            return
        }
        guard let password = passwordField.text, password.count > 0 else {
            return
        }
        
        // 3
        let name = UIDevice.current.name
      //  let user = User(name: name, email: email)
    }

}
