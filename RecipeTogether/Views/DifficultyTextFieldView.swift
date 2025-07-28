//
//  DifficultyTextFieldView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 28/07/25.
//
import SwiftUI

struct DifficultyTextFieldView: View {
    var difficulty: String
    var body: some View {
        Text("Difficulty: \(difficulty)")
            .font(RecipeFonts.body)
            .foregroundStyle(ThemeColors.getDifficultyColor(difficulty))
            .padding(RecipeSpacing.sm)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(ThemeColors.getDifficultyColor(difficulty).opacity(0.17))   // or ThemeColors.card
            )
    }
}

#Preview {
    DifficultyTextFieldView(difficulty: recipes[0].difficulty)
}
