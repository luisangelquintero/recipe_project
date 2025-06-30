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
            AsyncImage(url: URL(string: "http://127.0.0.1:8000/images/hello_49bff9076ef14dd3944c91ef34e8bfa2.jpg")){ phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("Error loading image")
                } else {
                    ProgressView()
                }
                
            }
            .cornerRadius(15)
                .containerRelativeFrame(.vertical) { size, axis in
                    size * 0.35
                }
            Text(recipe.title).font(RecipeFonts.title)
            HStack {
                
                Text("Time: \(recipe.minutes)").font(RecipeFonts.body)
                Spacer()
                Text("Difficulty: \(recipe.difficulty)").font(RecipeFonts.body)
                
            }.padding([.horizontal, .bottom], RecipeSpacing.xs).font(.subheadline)
            Spacer()
            VStack {
                Text("Ingedients:").font(RecipeFonts.section)
                Text(recipe.ingredients).font(RecipeFonts.body)
                
            }
            VStack{
                Text("Instructions:").font(RecipeFonts.section)
                Text(recipe.instructions).font(RecipeFonts.body)
            }
            
        }.padding(RecipeSpacing.md)
        
    }
}

#Preview {
    RecipeDetailView(recipe: recipes[0])
}
