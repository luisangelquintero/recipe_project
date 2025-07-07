//
//  test.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 6/07/25.
//
import SwiftUI


struct NavBar_BackgroundColor_Material: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green
                    .ignoresSafeArea()
               
                VStack {
                    Divider()
                        .background(.ultraThinMaterial)
                        
                    Text("Have the style touching the safe area edge.")
                        .padding()
                        
                    Spacer()
                }
                .navigationTitle("Nav Bar Background")
                .font(.title2)
            }
        }
    }
}


#Preview {
    NavBar_BackgroundColor_Material()
}
