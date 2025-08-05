//
//  LoginDTOs.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 5/08/25.
//
import Foundation

struct LoginRequest: Codable, Sendable {
    let email: String
    let password: String
}

struct LoginResponse: Codable, Sendable, Equatable {
    let token: String
    let userId: String
}
