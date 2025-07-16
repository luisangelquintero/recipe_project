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
    
    var difficulty = 1
    
    var title = ""
    var ingredients = ""
    var instructions = ""
    var minutes = ""
    
    var isFormDisabled: Bool {
        title.count < 5 &&
        ingredients.count < 10 &&
        instructions.count < 15 &&
        minutes.isEmpty &&
        Int(minutes) == nil        
    }
    
}
