//
//  LoginVM.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 12/08/25.
//
import Foundation

@Observable
class LoginVM  {
    var email: String = ""
    var password: String = ""
    var isLoading: Bool = false
    var errorMessage: String?
    var token: String?
    
    
    var isValid: Bool {
        return  email.count > 10 && password.count >= 6
        && email.contains("@") && email.contains(".")
    }
    
    func login() async throws {
        guard isValid else {
            errorMessage = "Please check your email and password"
            return
        }
        
        isLoading = true
        
        defer { isLoading = false}
        
        do {
            let user = LoginRequest(email: email, password: password)
            let response = try await AuthService.login(user: user)
            token = response.token
            errorMessage = nil
            // TODO: persist token (Keychain) and route to Home
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}
