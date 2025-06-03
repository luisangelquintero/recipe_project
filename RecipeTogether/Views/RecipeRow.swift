//
//  RecipeRow.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 27/05/25.
//
import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading){
            Text(recipe.title).font(.title2)
            Text(recipe.difficulty).font(.headline)
            HStack{
                Text("\(recipe.ingredients) Ingredients")
                Spacer()
                Text("Effort: \(recipe.effort)")
            }.font(.subheadline)
        }
    }
}

#Preview {
    RecipeRow(recipe: recipes[0]).padding(.all, 30)
}
