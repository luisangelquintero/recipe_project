//
//  RecipeListView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI

struct HomeScreenView: View {
    
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
                        RecipeList()
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
        
    }
}

#Preview {
    HomeScreenView()
}
