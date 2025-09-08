//
//  MainTabView.swift
//  Cookcademy
//
//  Created by dzthnxf dthf on 06.09.25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem {
                    Label("Recipes", systemImage: "book")
                }
            NavigationView {
                RecipesListView(viewStyle: .favorites)
            }
            .tabItem {
                Label("Favorites", systemImage: "star")
            }
        } .environmentObject(recipeData)
    }
}

#Preview {
    MainTabView()
}
