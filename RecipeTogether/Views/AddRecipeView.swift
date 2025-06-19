//
//  AddRecipeView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var title = ""
    @State private var ingredients = ""
    @State private var instructions = ""
    @State private var difficulty = ""
    @State private var minutes = ""
    
    let difficultyOptions: [String] = ["Easy", "Medium", "Hard"]
    
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
                }
            }
        }
        .navigationTitle("Add Recipe")
        }
    }
    
    func submitRecipe() async throws {
        guard let url = URL(string: "http://localhost:8000/recipes") else {
            print("Invalid URL")
            return
        }
        
        let recipeData: [String: Any] = [
            "title": title,
            "difficulty": difficulty,
            "effort": "f",
            "minutes": Int(minutes) ?? 0,
            "ingredients": ingredients,
            "instructions": instructions
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
