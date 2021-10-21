//
//  AccountCreationViewModel.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 01/09/21.
//

import SwiftUI
import FirebaseAuth

class FirebaseAuth: ObservableObject{
    let auth = Auth.auth()
    
    @Published var signedIn = false
 
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true

            }
            
        }
        
    }
    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
    
//    func updatePassword(password: String, resetCompletion:@escaping (Result<Bool,Error>) -> Void){
//        auth.currentUser?.updatePassword(to: password, completion: { error in
//            <#code#>
//        })
//    }
    
    func resetPassword(email: String, resetCompletion:@escaping (Result<Bool,Error>) -> Void){
        auth.sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                resetCompletion(.failure(error))
            } else{
                resetCompletion(.success(true))
            }
        }
    }
}
