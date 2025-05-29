//
//  RecipeDetailView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//
import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Text(recipe.title).font(.title)
            HStack {
                Text(recipe.effort)
                
            }
            
            Spacer()
            VStack(alignment: .leading) {
                List(recipe.ingredients, id: \.self) {
                    Text($0)
                    
                }.listStyle(PlainListStyle())
            }
            VStack{
                Text(recipe.instructions)
                Spacer()
            }
            
        }.padding(20)
        
    }
}

#Preview {
    RecipeDetailView(recipe: recipes[0])
}
