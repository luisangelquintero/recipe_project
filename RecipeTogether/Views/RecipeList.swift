//
//  RecipeList.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 28/05/25.
//
import SwiftUI

struct RecipeList: View {
    var body: some View {
        List(recipes){ recipe in
            RecipeRow(recipe: recipe)
        }.listStyle(PlainListStyle())

    }
}

#Preview {
    RecipeList()
}
