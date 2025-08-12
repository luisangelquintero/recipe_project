//
//  AuthService.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 11/08/25.
//
import Foundation

struct AuthService {
    static func login(user: LoginRequest) async throws -> LoginResponse {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(user)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw AuthError.badResponse
        }
        
        if let decoded = try? JSONDecoder().decode(LoginResponse.self, from: data) {
            return decoded
        } else {
            throw AuthError.decodeFailed
        }
    }
}
