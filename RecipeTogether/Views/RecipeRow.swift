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
            Text(recipe.title).font(RecipeFonts.section)
                .foregroundStyle(ThemeColors.textPrimary)
            DifficultyTextFieldView(difficulty: recipe.difficulty)
            HStack{
                Text("Time: \(recipe.minutes) minutes")
            }.font(RecipeFonts.caption).foregroundStyle(ThemeColors.TextSecondary)
        }
    }
}

#Preview {
    RecipeRow(recipe: recipes[0])
}
