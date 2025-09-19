//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Barborisss Macaroni on 06.08.25.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @Binding var mainInformation: MainInformation 
    
    var body: some View {
        Form {
            TextField("Recipe name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Autor", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
            }
            Picker(selection: $mainInformation.category, label:
                    HStack {
                Text("Category")
                //                Spacer()
                //                Text(mainInformation.category.rawValue)  // Хз зачем это здесь
            }) {
                ForEach(MainInformation.Category.allCases,
                        id: \.self) { category in
                    Text(category.rawValue)
                }
                        .pickerStyle(MenuPickerStyle()) // Идёт по умолчанию
                
            }
            .listRowBackground(listBackgroundColor)
        }
        .foregroundColor(listTextColor)
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "", description: "", author: "", category: .dessert)
    
    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInformation)
    }
}
