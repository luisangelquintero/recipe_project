//
//  Recipes.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 26/05/25.
//
import Foundation

struct Recipe: Hashable, Codable, Identifiable {
    let id: String
    let title: String
    let difficulty: String
    let ingredients: String
    let minutes: Int
    let instructions: String
    let imagePath : String
    let timestamp: String
    
    
    
    var numberOfIngredients: Int {
        return 2    }
}
