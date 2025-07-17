//
//  AddRecipeView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    @State private var addRecipe = AddRecipeModel()
    
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
        
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                ThemeColors.background.ignoresSafeArea()
                
                VStack {
                    Text("Add a new recipe")
                        .font(RecipeFonts.title)
                        .foregroundColor(ThemeColors.textPrimary)
                    Form {
                        
                        Section(header: Text("Recipe Info:").font(RecipeFonts.section).foregroundColor(ThemeColors.TextSecondary)) {
                            
                            TextField("Title", text: $addRecipe.title).font(RecipeFonts.body)
                            
                            TextField("Ingredients", text: $addRecipe.ingredients).font(RecipeFonts.body)
                            
                            Picker("Difficulty", selection: $addRecipe.difficulty) {
                                ForEach(AddRecipeModel.difficultyOptions, id: \.self) {
                                    Text($0).font(RecipeFonts.body)
                                }
                            }
                        }.listRowBackground(ThemeColors.background)
                        
                        Section(header: Text("Instructions:").font(RecipeFonts.section).foregroundColor(ThemeColors.TextSecondary)) {
                            
                            TextEditor(text: $addRecipe.instructions)
                                .frame(minHeight: 150)
                                .listRowBackground(ThemeColors.background)
                        }.listRowBackground(ThemeColors.background)
                        
                        Section (header: Text("Estimated time (minutes):").font(RecipeFonts.section).foregroundColor(ThemeColors.TextSecondary)){
                            HStack {
                                TextField("time", text: $addRecipe.minutes)
                            }
                        }.listRowBackground(ThemeColors.background)
                        
                        Section{
                            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                                Label("Select Image", systemImage: "photo").foregroundColor(ThemeColors.primary)
                            }
                        }.listRowBackground(ThemeColors.background).onChange(of: selectedPhoto) { _ , newValue in
                            guard let newItem = newValue else { return }
                            Task {
                                if let data = try? await newItem.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data){
                                    selectedImage = uiImage
                                    do {
                                        addRecipe.uploadedImageURL = try await RecipeService.uploadImage(uiImage, title: addRecipe.title)
                                        print("✅ Uploaded to: \(addRecipe.uploadedImageURL)")
                                    } catch {
                                        print("❌ Upload failed: \(error)")
                                    }
                                }
                            }
                            
                        }
                        
                        Section {
                            Button("Submit Recipe") {
                                Task {
                                    guard let recipe = addRecipe.recipe else {
                                        print("⚠️ Recipe is invalid — missing fields or wrong values.")
                                        return
                                    }
                                    
                                    do {
                                        try await RecipeService.submitRecipe(recipe)
                                    } catch {
                                        print("❌ Failed to submit recipe: \(error)")
                                    }
                                }
                            }.listRowBackground(ThemeColors.background).font(RecipeFonts.button)
                        }.disabled(addRecipe.isFormDisabled)
                    }.background(.yellow)
                }}
        }
        
    }
    
}

#Preview {
    AddRecipeView()
}
