//
//  RecipeList.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 28/05/25.
//
import SwiftUI

struct RecipeList: View {
    var recipeList : [Recipe]
    var body: some View {
        NavigationView {
            List(recipeList){ recipe in
                NavigationLink{
                    RecipeDetailView(recipe: recipe)
                } label: {
                    RecipeRow(recipe: recipe)
                        .padding(.trailing, 30)
                }
                
            }.listStyle(PlainListStyle())
            .navigationBarTitle("Recipes")
            
        }

    }
}

#Preview {
    RecipeList(recipeList: recipes)
}
