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
    @State private var difficulty = "Easy"
    
    let difficultyOptions: [String] = ["Easy", "Medium", "Hard"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Info:")) {
                    TextField("Title", text: $title)
                    TextField("Ingredients", text: $ingredients)
                    Picker("Difficulty", selection: $difficulty) {
                        ForEach(difficultyOptions, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Instructions:")) {
                    TextEditor(text: $instructions)
                        .frame(minHeight: 150)
                }
                
                Section (header: Text("Estimated time (minutes):")){
                    HStack {
                        TextField("time", text: $title)
                    }
                }
                
                Section {
                    Button(action: {
                        submitRecipe()
                    }) {
                        Text("Add Recipe")
                    }
                }
            }
        }
        .navigationTitle("Add Recipe")
    }
    
    func submitRecipe() {
        print("Recipe submitted: \(title), \(difficulty), effort:")
        // ToDo integrate API or local DB saving logic
    }
}

#Preview {
    AddRecipeView()
}
