//
//  LoginView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 4/08/25.
//
import SwiftUI

struct LoginView: View {
    @State private var loginData = LoginVM()
    @State private var showPassword = false
    // @FocusState private var focusField: Field?
    
    var body: some View {
        VStack(spacing: RecipeSpacing.lg){
            Text("Hey, Welcome Back!")
                .foregroundStyle(ThemeColors.primary)
                .font(RecipeFonts.title)
            
            VStack(spacing: RecipeSpacing.md){
                TextField("Email:", text: $loginData.email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .textContentType(.username)
                    .autocorrectionDisabled()
                    .padding(RecipeSpacing.md)
                    .background(RoundedRectangle(cornerRadius: 4).fill(ThemeColors.secondary))
                
                HStack{
                    if showPassword {
                        TextField("Password:", text: $loginData.password)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.default)
                            .textContentType(.password)
                            .autocorrectionDisabled()
                            .padding(RecipeSpacing.md)
                            .background(RoundedRectangle(cornerRadius: 4).fill(ThemeColors.secondary))
                    } else {
                        SecureField("Password:", text: $loginData.password)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.default)
                            .textContentType(.password)
                            .autocorrectionDisabled()
                            .padding(RecipeSpacing.md)
                            .background(RoundedRectangle(cornerRadius: 4).fill(ThemeColors.secondary))
                    }
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                    }
                    .tint(ThemeColors.primary)
                }
                
            }
        }
        .padding(20)
        .background(ThemeColors.background.ignoresSafeArea())
            
    }
}

#Preview {
    LoginView()    
}
