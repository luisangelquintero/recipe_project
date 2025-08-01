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
        print("------------")
        print("title.count\(title.count)")
        print("title.count > 5 \(title.count > 5)")
        print("ingredients.count\(ingredients.count)")
        print("ingredients.count > 10 \(ingredients.count > 10)")
        print(" instructions.count\( instructions.count)")
        print(" instructions.count > 15\( instructions.count > 15)")
        print("minutes.count\(minutes.count)")
        print(" minutes.count > 0\(  minutes.count > 0)")
        print(" Int(minutes) != nil\( Int(minutes) != nil)")
        print("difficulty.isEmpty\(!difficulty.isEmpty)")
        print("uploadedImageURL.isEmpty\(!uploadedImageURL.isEmpty)")
        print("------------")

        return title.count < 5 ||
        ingredients.count < 10 ||
        instructions.count < 15 ||
        minutes.count < 0 ||
        Int(minutes) == nil ||
        difficulty.isEmpty ||
        uploadedImageURL.isEmpty
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
