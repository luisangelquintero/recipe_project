//
//  ThemeSpacing.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 17/06/25.
//
import SwiftUI
///
/// xs > micro gaps (text icon insets)
/// sm > element spacing, button padding
/// md > standard section spacing
/// lg > screen padding, card margin
/// xl > large block separation, titles
///

enum RecipeSpacing {
    static let xs : CGFloat = 4 // micro spacing (icon padding, text insets)
    static let sm : CGFloat = 8 // small spacing (tight layouts)
    static let md : CGFloat = 16 // medium/default spacing (standard padding)
    static let lg : CGFloat = 24 // large spacing (between sections)
    static let xl : CGFloat = 32 // large spacing (between sections)
}
