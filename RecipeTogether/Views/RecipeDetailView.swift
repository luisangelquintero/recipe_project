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
            Image(recipe.title)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .containerRelativeFrame(.vertical) { size, axis in
                    size * 0.35
                }
            HStack {
                
                Text("Time: \(recipe.effort)")
                Spacer()
                Text("Difficulty: \(recipe.difficulty)")
                
            }.padding([.horizontal, .bottom],20).font(.subheadline)
            Spacer()
            VStack(alignment: .leading) {
                Text("Ingedients:").font(.headline)
                List(recipe.ingredients, id: \.self) {
                    Text($0)
                    
                }.listStyle(PlainListStyle())
                
            }
            VStack{
                Text("Instructions:").font(.headline)
                Text(recipe.instructions)
            }
            
        }.padding(20)
        
    }
}

#Preview {
    RecipeDetailView(recipe: recipes[0])
}
