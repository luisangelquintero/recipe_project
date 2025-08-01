//
//  DifficultyTextFieldView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 28/07/25.
//
import SwiftUI

struct TimeTextFieldView: View {
    var time: Int
    var body: some View {
        Text("Time: \(time) minutes")
            .font(RecipeFonts.body)
            .foregroundStyle(ThemeColors.TextSecondary)
            .padding(RecipeSpacing.sm)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(ThemeColors.TextSecondary.opacity(0.15))
            )
    }
}

#Preview {
    TimeTextFieldView(time: recipes[0].minutes)
}
