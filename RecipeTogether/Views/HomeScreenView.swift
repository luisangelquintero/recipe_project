//
//  RecipeListView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI

struct Response: Codable {
    let results: [Recipe]
}

struct HomeScreenView: View {
    @State private var recipeList: [Recipe] = []
    
    var body: some View {
        
        
        
        NavigationStack {
   
                VStack(spacing: 5){

                    Spacer()
                    HStack{
                        Text("Hello,  Alex")
                            .font(.largeTitle)
                        Spacer()
                        Image("ProfileImages")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                        
                    }
                    VStack(alignment: .leading){
                        RecipeList(recipeList: recipes)
                    }

                    
                    NavigationLink(destination: AddRecipeView()) {
                        Text("Add Recipe")
                    }
                }.toolbar{
                    Button(action: {}) {
                        HStack{
                            Text("Add Recipe")
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
        guard let url = URL(string: "http://localhost:8000/recipes") else {
            print( "Invalid URL")
            return
        }
        
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                recipeList = decodedResponse.results
            }
        } catch {
            print("invalid data")
        }
        
        
        
    }
}

#Preview {
    HomeScreenView()
}
