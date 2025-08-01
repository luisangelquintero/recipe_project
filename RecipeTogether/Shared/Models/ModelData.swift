//
//  ModelRecipeData.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 26/05/25.
//

import Foundation

var recipes: [Recipe] = load("recipes.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data : Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError( "File \(filename).json not found")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError( "Unable to load \(filename).json from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError( "Unable to parse \(filename) as \(T.self): \n\(error)")
    }
    
}
