//
//  RecipeListView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Recipe]()
    
    var body: some View {
            
            NavigationStack {
                ZStack{
                    ThemeColors.background
                        .ignoresSafeArea()
                    VStack(spacing: 5){
                        Divider()
                        HStack{
                            Text("Hello,  Alex")
                                .foregroundColor(ThemeColors.textPrimary)
                                .font(RecipeFonts.title)
                            Spacer()
                            Image("ProfileImages")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                        }
                        Divider()
                        VStack(alignment: .leading){
                            RecipeList(recipeList: results)
                        }
                    }
                
                .toolbar {
                        HStack {
                            NavigationLink {
                                AddRecipeView()
                                
                            } label: {
                                Text("Add Recipe").font(RecipeFonts.button)
                                Image(systemName: "plus")
                            }

                        }                    
                    .foregroundColor(ThemeColors.primary)
                    .accessibilityLabel("Add Recipe")
                }
                .padding(.all, RecipeSpacing.md)
                }
            }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: ApiConfig.recipeEndpint) else {
            print( "Invalid URL")
            return
        }
        
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Recipe].self, from: data){
                results = decodedResponse
            }
        } catch {
            print("invalid data")
        }
        
        
        
    }
}

#Preview {
    ContentView().background(ThemeColors.difficultyHard)
}
