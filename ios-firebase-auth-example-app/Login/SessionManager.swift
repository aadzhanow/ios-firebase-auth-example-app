//
//  SessionManager.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 19.05.2024.
//

import Foundation
import FirebaseAuth

class SessionManager {
    static let shared = SessionManager()

    public func checkAuthState(completion: @escaping (_ isLoggedIn: Bool) -> Void) {
        let isLoggedIn = Auth.auth().currentUser != nil
        completion(isLoggedIn)
    }
    
    public func login(email: String, password: String, completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                completion(false, error)
                return
            }
            completion(authResult != nil, nil)
        }
    }
    
    public func register(email: String, password: String, completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Registration error: \(error.localizedDescription)")
                completion(false, error)
                return
            }
            completion(authResult != nil, nil)
        }
    }
}
