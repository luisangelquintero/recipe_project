//
//  Recipes.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 26/05/25.
//
import Foundation

struct Recipe: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var difficulty: String
    var ingredients: String
    var minutes: Int
    var instructions: String
    
    var numberOfIngredients: Int {
        return 2    }
}
