//
//  AuthError.swift
//  AuthError
//
//  Created by Luis angel Quintero arias on 11/06/25.
//
import Foundation

enum AuthError: LocalizedError {
    case badResponse, decodeFailed
    
    var errorDescription: String? {
        switch self {
        case .badResponse:
            return "Invalid email or password"
        case .decodeFailed:
            return "Could not read server response"
        }
    }
}


//enum AuthError: LocalizedError, Equatable, Sendable {
//    case badResponse(status: Int)   // carry the status code
//    case decodeFailed(underlying: Error?)
//    
//    var errorDescription: String? {
//        switch self {
//        case .badResponse(let status):
//            "Login failed (HTTP \(status)). Check your email and password."
//        case .decodeFailed:
//            "Could not read server response."
//        }
//    }
//}
