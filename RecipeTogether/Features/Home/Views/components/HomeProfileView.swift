//
//  HomeProfileView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 30/07/25.
//
import SwiftUI

struct HomeProfileView: View {
    var loggIn : Bool = false
    var body: some View {
        HStack{
            if loggIn {
                Text("Hello,  Alex")
                    .foregroundColor(ThemeColors.textPrimary)
                    .font(RecipeFonts.title)
                Spacer()
                Image("ProfileImages")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
            }else{
                HStack{
                    Text("Hi There!")
                        .foregroundColor(ThemeColors.textPrimary)
                        .font(RecipeFonts.title)
                    Spacer()
                    Button("Login", systemImage: "person.circle.fill"){
                        print("Login")
                    }.font(RecipeFonts.button)
                        .padding(RecipeSpacing.sm)
                        .background(ThemeColors.primary)
                        .foregroundStyle(ThemeColors.background)
                        .clipShape(Capsule())
                    
                    
                }.padding(RecipeSpacing.md)
            }
                
   
        }
    }
}

#Preview {
    HomeProfileView()
}
