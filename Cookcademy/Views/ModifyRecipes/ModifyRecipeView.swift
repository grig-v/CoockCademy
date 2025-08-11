//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by dzthnxf dthf on 16.07.25.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    @State private var selection = Selection.main
    enum Selection {
        case main, ingredients, directions
    }
    
    var body: some View {
            VStack {
                Picker("Select recipe component", selection: $selection) {
                    Text("Main Info").tag(Selection.main)
                    Text("Ingredients").tag(Selection.ingredients)
                    Text("Directions").tag(Selection.directions)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                switch selection {
                case .main:
                    ModifyMainInformationView(mainInformation: $recipe.mainInformation) 
                case .ingredients:
                    ModifyIngredientsView(ingredients: $recipe.ingredients)
                case .directions:
                    Text("Directions Info")
                }
                Spacer()
            }
    }
}



struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        NavigationView {
            ModifyRecipeView(recipe: $recipe)
        }
    }
}

