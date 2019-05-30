//
//  SignUpViewController.swift
//  project3-tracker
//
//  Created by Tomas Mateo Perotti on 29/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    // MARK: -IBOutlets
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Selectors
    
    @IBAction func btnSignUp(_ sender: Any) {
        handleSignUp()
    }
    func handleSignUp() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let username = usernameTextField.text else { return }
        
        createUser(email: email, password: password, username: username)
    }
    
    func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - API
    
    func createUser(email: String, password: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to sign user with error: ", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = ["email": email, "username": username]
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Failed to sign user with error: ", error.localizedDescription)
                    return
                }
                
                print("Succesfully signed up user uid...")
                
            })
        }
    }

}
