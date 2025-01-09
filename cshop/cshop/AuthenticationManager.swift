//
//  AuthenticationManager.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 4.01.2025.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    let uid : String
    let email : String?
    
    init(user :User){
        self.uid = user.uid
        self.email = user.email
    }
    
}
final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    
    private init() {}
    
    func createUser(email : String, password : String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
}

