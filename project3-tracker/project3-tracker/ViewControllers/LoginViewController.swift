//
//  ViewController.swift
//  project3-tracker
//
//  Created by Tomas Mateo Perotti on 27/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
 
    @IBOutlet var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
    }
    
    // MARK: - Selectors
    
}

extension LoginViewController: LoginViewDelegate {
    
    func tappedOnSignUp() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUp") as? SignUpViewController {
                self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - API
    func tappedOnSignIn() {
        guard let email = loginView.emailTextField.text else { return }
        guard let password = loginView.passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed sign in. ", error.localizedDescription)
            }
            let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homevc")
            let navController = UINavigationController(rootViewController: homeViewController)
            self.present(navController, animated: true, completion: nil)
            print("Succesfully logged in")
        }
        
    }
    
    
}

