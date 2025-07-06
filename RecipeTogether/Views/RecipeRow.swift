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
            Text(recipe.difficulty).font(RecipeFonts.body).foregroundStyle(ThemeColors.TextSecondary)
            HStack{
                Text("Time: \(recipe.minutes) minutes")
            }.font(RecipeFonts.caption).foregroundStyle(ThemeColors.TextSecondary)
        }
    }
}

#Preview {
    RecipeRow(recipe: recipes[0]).padding(.all, 30)
}
