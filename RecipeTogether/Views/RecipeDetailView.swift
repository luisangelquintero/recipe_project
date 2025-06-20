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
            Text(recipe.title).font(RecipeFonts.title)
            Image(recipe.title)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .containerRelativeFrame(.vertical) { size, axis in
                    size * 0.35
                }
            HStack {
                
                Text("Time: \(recipe.minutes)").font(RecipeFonts.body)
                Spacer()
                Text("Difficulty: \(recipe.difficulty)").font(RecipeFonts.body)
                
            }.padding([.horizontal, .bottom],20).font(.subheadline)
            Spacer()
            VStack(alignment: .leading) {
                Text("Ingedients:").font(RecipeFonts.section)
                Text(recipe.ingredients).font(RecipeFonts.body)
                
            }
            VStack{
                Text("Instructions:").font(RecipeFonts.section)
                Text(recipe.instructions).font(RecipeFonts.body)
            }
            
        }.padding(20)
        
    }
}

#Preview {
    RecipeDetailView(recipe: recipes[0])
}
