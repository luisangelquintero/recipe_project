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
        VStack(spacing: RecipeSpacing.lg) {
            Spacer()
            Text("Hey, Welcome Back!")
                .foregroundStyle(ThemeColors.primary)
                .font(RecipeFonts.title)
            VStack(spacing: RecipeSpacing.md) {
                
                VStack(alignment: .leading){

                    HStack{
                        Image(systemName: "envelope.fill")
                            .symbolEffect(.wiggle.byLayer, options: .repeat(.periodic(delay: 1.0)))
                            .foregroundStyle(ThemeColors.primary)
                        
                        TextField("Email", text: $loginData.email)
                            .foregroundStyle(ThemeColors.primary)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .textContentType(.username)
                            .autocorrectionDisabled()
                    }
                    .padding(RecipeSpacing.md)
                    .background(
                        RoundedRectangle(cornerRadius: 12).fill(
                            ThemeColors.secondary
                        )
                    )
                }


                HStack {
                    Image(systemName: "lock.fill")
                        .symbolEffect(.wiggle.byLayer, options: .repeat(.periodic(delay: 1.0)))
                        .foregroundStyle(ThemeColors.primary)
                    
                   
                    if showPassword {
                        TextField("Password:", text: $loginData.password)
                    } else {
                        SecureField("Password:", text: $loginData.password)
                    }
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                    }
                    .tint(ThemeColors.primary)
                }
                .textContentType(.password)
                .padding(RecipeSpacing.md)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(
                        ThemeColors.secondary
                    )
                )
                .submitLabel(.go)
                .onSubmit {
                    Task {
                        do {
                            try await loginData.login()
                        } catch {
                            print("Login failed: \(error)")
                        }
                    }
                }

            }
            Button {
                Task {
                    do {
                        loginData.isLoading = true
                        try await loginData.login()
                    } catch {
                        print("Login failed: \(error)")
                    }
                }
            } label: {
                HStack {
                    if loginData.isLoading {
                        ProgressView().controlSize(.regular)
                    }
                    Text("Login")
                        .foregroundStyle(ThemeColors.primary)
                }
                .frame(maxWidth: .infinity)

            }
            .buttonStyle(.borderedProminent)
            .disabled(!loginData.isValid || loginData.isLoading)
            if let errorMessage = loginData.errorMessage {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
            }
            Spacer()
            
            Button {
                Task {
                    do {
                        try await loginData.login()
                    } catch {
                        print("Login failed: \(error)")
                    }
                }
            } label: {
                HStack {

                    Text("Create Account")
                        .foregroundStyle(ThemeColors.primary)
                }
                .frame(maxWidth: .infinity)
                
            }
            
            
        }
        .padding(20)
        .navigationTitle("Login")
        .toolbarTitleDisplayMode(.inline)
        .background(ThemeColors.background.ignoresSafeArea())

    }
}

#Preview {
    LoginView()
}
