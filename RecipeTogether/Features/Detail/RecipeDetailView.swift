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
        ScrollView {
            VStack {
                // ImageSection
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
                // Header section
                Spacer()
                Text(recipe.title).font(RecipeFonts.title).foregroundStyle(ThemeColors.textPrimary)
                Spacer()
                HStack {
                    
                    TimeBadge(time: recipe.minutes)
                    Spacer()
                    
                    DifficultyBadge(difficulty: recipe.difficulty)
                    
                }.padding([.horizontal, .bottom], RecipeSpacing.xs).font(.subheadline)
                
                // Ingredients
                
                Spacer()
                
                VStack(alignment:.leading){
                    Text("Ingedients:").font(RecipeFonts.section)
                    Text(recipe.ingredients).font(RecipeFonts.body)
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(RecipeSpacing.sm)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(ThemeColors.secondary)   // or ThemeColors.card
                    )
                
                // Instructions
                Spacer()
                VStack(alignment:.leading){
                    Text("Instructions:").font(RecipeFonts.section)
                    Text(recipe.instructions).font(RecipeFonts.body)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(RecipeSpacing.sm)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(ThemeColors.secondary)
                    )
                Spacer()
                
                
            }.padding(RecipeSpacing.md)
        }
        
    }
}

#Preview {
    RecipeDetailView(recipe: recipes[0])
}
