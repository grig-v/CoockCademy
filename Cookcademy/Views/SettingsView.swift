//
//  SettingsView.swift
//  Cookcademy
//
//  Created by Barborisss Macaroni on 10.09.25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("hideOptionalSteps") private var hideOptionalSteps: Bool = false
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationView {
            Form {
                ColorPicker("Background color", selection: $listBackgroundColor)  .listRowBackground(listBackgroundColor)
                ColorPicker("Text Color", selection: $listTextColor) .listRowBackground(listBackgroundColor)
                Toggle("Hide optional steps", isOn: $hideOptionalSteps) .listRowBackground(listBackgroundColor)
            }
            .foregroundColor(listTextColor)
            .navigationTitle("Settings")
            
        }
    }
}

#Preview {
    @Previewable @State var hideOptionalSteps: Bool = false
    @Previewable @State var listBackgroundColor = AppColor.background
    @Previewable @State var listTextColor = AppColor.foreground
    SettingsView()
}
