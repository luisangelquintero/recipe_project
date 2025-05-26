//
//  ModelRecipeData.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 26/05/25.
//

import Foundation

var recipes: [Recipes] = load("recipes")

func load<T: Decodable>(_ fileName: String) -> T {
    let data : Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError( "File \(fileName).json not found")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError( "Unable to load \(fileName).json from main bundle: \n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError( "Unable to parse \(fileName) as \(T.self): \n\(error)")
    }
    
}
