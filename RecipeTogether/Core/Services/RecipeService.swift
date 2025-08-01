//
//  RecipeService.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 7/07/25.
//

import SwiftUI
import Foundation

struct RecipeService {
    
    static func uploadImage(_ image: UIImage, title: String) async throws -> String {
        guard let url = URL(string: ApiConfig.uploadImageEndpoint) else {
            throw URLError(.badURL)
        }

        let boundary = UUID().uuidString
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let imageData = image.jpegData(compressionQuality: 0.8) ?? Data()
        var body = Data()

        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n")
        body.append("Content-Type: image/jpeg\r\n\r\n")
        body.append(imageData)
        body.append("\r\n")

        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"recipe_title\"\r\n\r\n")
        body.append(title)
        body.append("\r\n")

        body.append("--\(boundary)--\r\n")

        request.httpBody = body

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        if let decoded = try? JSONDecoder().decode([String: String].self, from: data),
           let imageUrl = decoded["url"] {
            return imageUrl
        } else {
            throw URLError(.cannotParseResponse)
        }
    }

    static func submitRecipe(_ recipeData: Recipe) async throws {
        guard let url = URL(string: ApiConfig.recipeEndpint) else {
            throw URLError(.badURL)
        }
        let jsonData = try JSONEncoder().encode(recipeData)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            print("✅ Status: \(httpResponse.statusCode)")
        }

        if let responseStr = String(data: data, encoding: .utf8) {
            print("📦 Response: \(responseStr), jsonData: \(recipeData)")
        }
    }
}
