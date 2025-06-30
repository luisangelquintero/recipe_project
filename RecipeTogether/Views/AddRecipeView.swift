//
//  AddRecipeView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    
    @State private var title = ""
    @State private var ingredients = ""
    @State private var instructions = ""
    @State private var difficulty = ""
    @State private var minutes = ""
    
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var uploadedImageURL: String? = nil
    
    let difficultyOptions: [String] = ["Easy", "Medium", "Hard"]
    
    var disableForm: Bool {
        let fieldsValidation = title.count < 5 || ingredients.count < 10 || instructions.count < 15 || difficulty.isEmpty
        let timeValidation = minutes.isEmpty || Int(minutes) == nil        
        return fieldsValidation || timeValidation
    }
    
    var body: some View {
        VStack {
            Text("Add a new recipe").font(RecipeFonts.title)
        NavigationView {
            Form {
                Section(header: Text("Recipe Info:").font(RecipeFonts.section)) {
                    TextField("Title", text: $title).font(RecipeFonts.body)
                    TextField("Ingredients", text: $ingredients).font(RecipeFonts.body)
                    Picker("Difficulty", selection: $difficulty) {
                        ForEach(difficultyOptions, id: \.self) {
                            Text($0).font(RecipeFonts.body)
                        }
                    }
                }
                
                Section(header: Text("Instructions:").font(RecipeFonts.section)) {
                    TextEditor(text: $instructions)
                        .frame(minHeight: 150)
                }
                
                Section (header: Text("Estimated time (minutes):").font(RecipeFonts.section)){
                    HStack {
                        TextField("time", text: $minutes)
                    }
                }
                Section{
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        Label("Select Image", systemImage: "photo")
                    }
                }.onChange(of: selectedPhoto) { oldValue, newValue in
                    guard let newItem = newValue else { return }
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self),
                            let uiImage = UIImage(data: data){
                            selectedImage = uiImage
                            do {
                                uploadedImageURL = try await uploadImage(uiImage)
                                print("✅ Uploaded to: \(uploadedImageURL ?? "")")
                            } catch {
                                print("❌ Upload failed: \(error)")
                            }
                        }
                    }
                    
                }

                
                Section {
                    Button("Submit Recipe") {
                        Task {
                            do {
                                try await submitRecipe()
                            } catch {
                                print("❌ Failed to submit recipe: \(error)")
                            }
                        }
                    }.font(RecipeFonts.button)
                }.disabled(disableForm)
            }
        }
        .navigationTitle("Add Recipe")
        }
    }
    
    
    func uploadImage(_ image: UIImage) async throws -> String {
        guard let url = URL(string: "http://localhost:8000/upload-image") else {
            throw URLError(.badURL)
        }
        
        let boundary = UUID().uuidString
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let imageData = image.jpegData(compressionQuality: 0.8) ?? Data()
        var body = Data()
        

        // Append file
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n")
        body.append("Content-Type: image/jpeg\r\n\r\n")
        body.append(imageData)
        body.append("\r\n")

        // Append recipe title
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
           let imageUrl = decoded["url"]{
            return imageUrl
        } else {
            throw URLError(.cannotParseResponse)
        }
    }
    
    func submitRecipe() async throws {
        guard let url = URL(string: "http://localhost:8000/recipes") else {
            print("Invalid URL")
            return
        }
        
        let recipeData: [String: Any] = [
            "id": UUID().uuidString,
            "title": title,
            "difficulty": difficulty,
            "ingredients": ingredients,
            "minutes": Int(minutes) ?? 0,
            "instructions": instructions,
            "imagePath": uploadedImageURL ?? "",
            "timestamp": ISO8601DateFormatter().string(from: Date())
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: recipeData) else {
            print("Error converting to JSON data")
            return
        }
        
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

#Preview {
    AddRecipeView()
}
