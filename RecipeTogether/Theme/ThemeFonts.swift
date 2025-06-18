//
//  ThemeFonts.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 17/06/25.
//
import SwiftUI

struct RecipeFonts {
    
    /// Used for screen titles like "Add Recipe"
    static var title: Font {
        Font.system(.title, design: .rounded).weight(.bold)
    }
    
    /// Used for section headers like "Ingredients"
    static var section: Font {
        Font.system(.headline, design: .rounded).weight(.semibold)
    }
    
    /// Used for standard paragraph text
    static var body: Font {
        Font.system(.body, design: .rounded).weight(.regular)
    }
    /// Used for extra notes, tags, secondary info
    
    static var caption: Font {
        Font.system(.caption, design: .rounded).weight(.medium)
    }
    
    /// Used for buttons and interactive elements
    static var button: Font {
        Font.system(.body, design: .rounded).weight(.semibold)
    }
}
