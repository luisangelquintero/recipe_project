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
            AsyncImage(url: URL(string: "http://127.0.0.1:8000\(recipe.imagePath)")){ phase in
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
            Spacer()
            Text(recipe.title).font(RecipeFonts.title).foregroundStyle(ThemeColors.textPrimary)
            Spacer()
            HStack {
                
                Text("Time: \(recipe.minutes)").font(RecipeFonts.body)
                    .foregroundStyle(ThemeColors.TextSecondary)
                Spacer()
                Text("Difficulty: \(recipe.difficulty)").font(RecipeFonts.body)
                    .foregroundStyle(ThemeColors.difficultyHard)
                
            }.padding([.horizontal, .bottom], RecipeSpacing.xs).font(.subheadline)
            Spacer()
            VStack(alignment:.leading){
                Text("Ingedients:").font(RecipeFonts.section)
                Text(recipe.ingredients).font(RecipeFonts.body)
                
            }.frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            VStack(alignment:.leading){
                Text("Instructions:").font(RecipeFonts.section)
                Text(recipe.instructions).font(RecipeFonts.body)
            }
            Spacer()
            
        }.padding(RecipeSpacing.md)
        
    }
}

#Preview {
    RecipeDetailView(recipe: recipes[0])
}
