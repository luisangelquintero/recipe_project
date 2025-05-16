//
//  RecipeListView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI

struct RecipeListView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Hello Alex")
                    .font(.largeTitle)
                Image("ProfileImages")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 120, height: 120)
                
            }
            VStack{
                Text("Recepies:")
                    .font(.largeTitle)
                VStack{                VStack{
                    Text("Spaghettie")
                    Text("Difficulty: Hard")
                    HStack{
                        Text("Number of ingredientes: 10")
                        Text("Effort: Hight")
                    }
                    
                }
                    VStack{
                        Text("Eggs")
                        Text("Difficulty: Easy")
                        HStack{
                            Text("Number of ingredientes: 2")
                            Text("Effort: Low")
                        }
                        
                    }
                }

                
            }
            
        }
    }
}

#Preview {
    RecipeListView()
}
