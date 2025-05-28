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
            Spacer()
            VStack(alignment: .leading){
                Text("Recepies:").font(.largeTitle)
                RecipeList()
            }
            
        }.padding(.all, 30)
    }
}

#Preview {
    HomeScreenView()
}
