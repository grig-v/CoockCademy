//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by dzthnxf dthf on 19.08.25.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView {
    @Binding var direction: Direction
    var createAction: (Direction) -> Void
    @Environment(\.dismiss) private var dismiss // Подсказад гпт. В курсе не так
    
    init(component: Binding<Direction>, createAction: @escaping (Direction) -> Void) {
        self._direction = component
        self.createAction = createAction
    }
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        Form {
            TextField("Tap your direction here...", text: $direction.description)
                .listRowBackground(listBackgroundColor)
            Toggle("Optional", isOn: $direction.isOptional)
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save"){
                    createAction(direction)
                    dismiss() // Подсказад гпт. В курсе не так
                }
                Spacer()
            } .listRowBackground(listBackgroundColor)
        }
        .foregroundStyle(listTextColor)
    }
}

#Preview {
    @Previewable @State var emptyDirection = Direction(description: "", isOptional: false)
    ModifyDirectionView(component: $emptyDirection) { direction in print(direction) }
}
