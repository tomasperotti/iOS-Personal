//
//  AuthController.swift
//  project2-habits
//
//  Created by Tomas Mateo Perotti on 27/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//
import CryptoSwift

class AuthController {

    static var isSignedIn: Bool {
        // 1
        guard let currentUser = Settings.currentUser else {
            return false
        }
        
        do {
            // 2
            let password = try KeychainPasswordItem(service: serviceName, account: currentUser.email).readPassword()
            return password.count > 0
        } catch {
            return false
        }
    }
    
    static let serviceName = "HabitsService"
    
    class func passwordHash(from email: String, password: String) -> String {
        let salt = "x4vV8bGgqqmQwgCoyXFQj+(o.nUNQhVP7ND"
        return "\(password).\(email).\(salt)".sha256()
    }
    
    static func signIn(_ user: User, password: String) {
        let finalHash = passwordHash(from: user.email, password: password)
        let keychain = KeychainPasswordItem(service: serviceName, account: user.email)
        do {
            let keychainPassword = try keychain.readPassword()
            if (keychainPassword.count > 0) {
                if (finalHash == keychainPassword) {
                    NotificationCenter.default.post(name: .loginStatusChanged, object: nil)
                }
            }
        } catch {
            do {
                Settings.currentUser = user
                try keychain.savePassword(finalHash)
                NotificationCenter.default.post(name: .loginStatusChanged, object: nil)
                print("Access granted.")

            } catch {
                print("Error signing in: \(error.localizedDescription)")
            }
        }

    }
    
}

extension Notification.Name {
    
    static let loginStatusChanged = Notification.Name("com.project2-habits.auth.changed")
    
}



