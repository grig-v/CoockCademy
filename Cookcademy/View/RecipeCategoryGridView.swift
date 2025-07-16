//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by dzthnxf dthf on 10.07.25.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @StateObject private var recipeData = RecipeData()
    
    var columns = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases,
                            id: \.self) { category in
                        NavigationLink(          // Тут непонятно
                            destination: RecipesListView(category: category).environmentObject(recipeData),
                            label: {
                                CategoryView(category: category)
                            })
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}


struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .opacity(0.65)
                .aspectRatio(contentMode: .fit)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
