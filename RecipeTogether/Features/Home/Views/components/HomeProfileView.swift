//
//  HomeProfileView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 30/07/25.
//
import SwiftUI

struct HomeProfileView: View {
    var body: some View {
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
    }
}

#Preview {
    HomeProfileView()
}
