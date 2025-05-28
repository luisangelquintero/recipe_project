//
//  RecipeListView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack{
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
                Text("Recepies:")
                    .font(.largeTitle)
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                    Text("Spaghettie").font(.title2)
                        Text("Hard").font(.headline)
                    HStack{
                        Text("8 ingredientes")
                        Spacer()
                        Text("Effort: Hight")
                    }.font(.subheadline)
                    
                }
                    Divider()
                    VStack(alignment: .leading){
                        Text("Eggs").font(.title2)
                        Text("Easy").font(.headline)
                        HStack{
                            Text("8 ingredientes")
                            Spacer()
                            Text("Effort: Low")
                        }.font(.subheadline)
                        
                    }
                }

                
            }
            
        }.padding(.all, 30)
    }
}

#Preview {
    HomeScreenView()
}
