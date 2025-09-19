//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Barborisss Macaroni on 10.07.25.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @EnvironmentObject private var recipeData: RecipeData
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(
                            destination: RecipesListView(viewStyle: .singleCategory(category)),
                            label: {
                                CategoryView(category: category)
                            })
                    }
                })
            }.navigationTitle("Categories")
        } .environmentObject(recipeData)
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

#Preview {
        RecipeCategoryGridView()
    }

