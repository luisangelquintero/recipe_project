//
//  AddRecipeView.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 16/05/25.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    
    @State private var title = ""
    @State private var ingredients = ""
    @State private var instructions = ""
    @State private var difficulty = ""
    @State private var minutes = ""
    
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var uploadedImageURL: String? = nil
    
    let difficultyOptions: [String] = ["Easy", "Medium", "Hard"]
    
    var disableForm: Bool {
        let fieldsValidation = title.count < 5 || ingredients.count < 10 || instructions.count < 15 || difficulty.isEmpty
        let timeValidation = minutes.isEmpty || Int(minutes) == nil
        return fieldsValidation || timeValidation
    }
    
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
                            
                            TextField("Title", text: $title)
                                .font(RecipeFonts.body)
                            
                            TextField("Ingredients", text: $ingredients).font(RecipeFonts.body)
                            
                            Picker("Difficulty", selection: $difficulty) {
                                ForEach(difficultyOptions, id: \.self) {
                                    Text($0).font(RecipeFonts.body)
                                }
                            }
                        }.listRowBackground(ThemeColors.background)
                        
                        Section(header: Text("Instructions:").font(RecipeFonts.section).foregroundColor(ThemeColors.TextSecondary)) {
                            
                            TextEditor(text: $instructions)
                                .frame(minHeight: 150)
                                .listRowBackground(ThemeColors.background)
                        }.listRowBackground(ThemeColors.background)
                        
                        Section (header: Text("Estimated time (minutes):").font(RecipeFonts.section).foregroundColor(ThemeColors.TextSecondary)){
                            HStack {
                                TextField("time", text: $minutes)
                            }
                        }.listRowBackground(ThemeColors.background)
                        
                        Section{
                            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                                Label("Select Image", systemImage: "photo")
                                    .foregroundColor(ThemeColors.primary)
                            }
                        }.listRowBackground(ThemeColors.background).onChange(of: selectedPhoto) { oldValue, newValue in
                            guard let newItem = newValue else { return }
                            Task {
                                if let data = try? await newItem.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data){
                                    selectedImage = uiImage
                                    do {
                                        uploadedImageURL = try await RecipeService.uploadImage(uiImage, title: title)
                                        print("✅ Uploaded to: \(uploadedImageURL ?? "")")
                                    } catch {
                                        print("❌ Upload failed: \(error)")
                                    }
                                }
                            }
                            
                        }
                        
                        
                        Section {
                            Button("Submit Recipe") {
                                Task {
                                    do {
                                        try await RecipeService.submitRecipe(Recipe(
                                            id: UUID().uuidString,
                                            title: title,
                                            difficulty: difficulty,
                                            ingredients: ingredients,
                                            minutes: Int(minutes) ?? 0,
                                            instructions: instructions,
                                            imagePath: uploadedImageURL ?? "",
                                            timestamp: ISO8601DateFormatter().string(from: Date())
                                        ))
                                    } catch {
                                        print("❌ Failed to submit recipe: \(error)")
                                    }
                                }
                            }.listRowBackground(ThemeColors.background).font(RecipeFonts.button)
                        }.disabled(disableForm)
                    }.background(.yellow)
                }}
        }
        
    }
    
}

#Preview {
    AddRecipeView()
}
