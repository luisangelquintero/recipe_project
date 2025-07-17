//
//  AddRecipeModel.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 15/07/25.
//
import Foundation

@Observable
class AddRecipeModel {
    static let difficultyOptions = ["Easy", "Medium", "Hard"]
    
    var difficulty = ""
    
    var title = ""
    var ingredients = ""
    var instructions = ""
    var minutes = ""
    
    var uploadedImageURL = ""
    
    var isFormDisabled: Bool {
        title.count < 5 &&
        ingredients.count < 10 &&
        instructions.count < 15 &&
        minutes.isEmpty &&
        Int(minutes) == nil        
    }
    
    var recipe: Recipe? {
        guard !isFormDisabled else { return nil }
        return Recipe(
            id: UUID().uuidString,
            title: title,
            difficulty: difficulty,
            ingredients: ingredients,
            minutes: Int(minutes) ?? 0,
            instructions: instructions,
            imagePath: uploadedImageURL,
            timestamp: ISO8601DateFormatter().string(from: Date())
        )
    }
}
