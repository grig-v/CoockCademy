//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by dzthnxf dthf on 08.08.25.
//

import SwiftUI

struct ModifyIngredientView: ModifyComponentView {
    @Binding var ingredient: Ingredient
    let createAction: (Ingredient) -> Void
    @Environment(\.presentationMode) private var mode
    
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
        self._ingredient = component
        self.createAction = createAction
    }
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
   @AppStorage("private let listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        VStack{
            Form {
                TextField("Ingredient name", text: $ingredient.name)
                    .listRowBackground(listBackgroundColor)
                Stepper(value: $ingredient.quantity, in: 0...1000, step: 0.5) {
                    HStack {
                        Text("Quantity:")
                        TextField("Quantity",
                                  value: $ingredient.quantity,
                                  formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation)
                        
                    }
                    
                }
                .listRowBackground(listBackgroundColor)
                Picker("Unit", selection: $ingredient.unit) {
                    ForEach(Component.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                        // В курсе пиккер был написан по-другому. Я упростил.
                    }
                }
                .listRowBackground(listBackgroundColor)
                HStack {
                    Spacer()
                    Button("Save") {
                        createAction(ingredient)
                        mode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
                .listRowBackground(listBackgroundColor)
            } .foregroundStyle(listTextColor)
           
        }
    }
}

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

#Preview {
    @Previewable @State var emptyingredient = Ingredient()
    ModifyIngredientView(component: $emptyingredient) { ingredient in print(ingredient) }
}
