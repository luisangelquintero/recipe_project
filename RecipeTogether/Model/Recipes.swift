//
//  Recipes.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 26/05/25.
//
import Foundation

struct Recipes: Hashable, Codable {
    var tittle: String
    var Difficulty: String
    var ingredients: [String]
    var effort: String
    
    var numberOfIngredients: Int {
        return ingredients.count
    }
}
