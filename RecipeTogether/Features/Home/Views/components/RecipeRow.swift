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
            Text(recipe.title).font(RecipeFonts.subtitle)
                .foregroundStyle(ThemeColors.textPrimary)
            DifficultyTextFieldView(difficulty: recipe.difficulty)
            TimeTextFieldView(time: recipe.minutes)
        }
    }
}

#Preview {
    RecipeRow(recipe: recipes[0])
}
