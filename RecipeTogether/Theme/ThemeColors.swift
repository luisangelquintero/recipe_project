//
//  ThemeColors.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 17/06/25.
//
import SwiftUI

struct ThemeColors {
    static let accent: Color = Color("AccentColor")
    static let background: Color = Color("BackgroundColor")
    static let card: Color = Color("CardColor")
    static let difficultyEasy: Color = Color("DifficultyEasy")
    static let difficultyHard: Color = Color("DifficultyHard")
    static let difficultyMedium: Color = Color("DifficultyMedium")
    static let primary: Color = Color("PrimaryColor")
    static let secondary: Color = Color("SecondaryColor")
    static let textPrimary: Color = Color("TextPrimaryColor")
    static let TextSecondary: Color = Color("TextSecondaryColor")
    
    static func getDifficultyColor(_ difficulty: String) -> Color {
        switch difficulty.lowercased() {
        case "easy":
            return self.difficultyEasy
        case "medium":
            return self.difficultyMedium
        case "hard":
            return self.difficultyHard
        default:
            return self.difficultyMedium
        }
    }
}
    

