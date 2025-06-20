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
   
                VStack(spacing: 5){

                    Spacer()
                    HStack{
                        Text("Hello,  Alex")
                            .font(RecipeFonts.title)
                        Spacer()
                        Image("ProfileImages")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                        
                    }
                    VStack(alignment: .leading){
                        RecipeList(recipeList: results)
                    }

                    
                    NavigationLink(destination: AddRecipeView()) {
                        Text("Add Recipe").font(RecipeFonts.button)
                    }
                }.toolbar{
                    Button(action: {}) {
                        HStack{
                            Text("Add Recipe").font(RecipeFonts.button)
                            Image(systemName: "plus")
                        }
                        
                    }.accessibilityLabel("Add Recipe")
                }
                .padding(.all, 30)
                
            }
        .task{
            await loadData()
        }
        
    }
    
    func loadData() async {
        guard let url = URL(string: "http://127.0.0.1:8000/recipes") else {
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
    ContentView()
}
