//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Barborisss Macaroni on 03.07.25.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
            saveRecipes()
        }
    }
    
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
        return nil
    }
    
    var favoriteRecipes: [Recipe] {
        recipes.filter { $0.isFavorite }
    }
    
    func saveRecipes() {  // Кодирует recipes в JSON и сохраняет в папке recipeData (см var recipesFileURL)
        do {
            let encodedData = try JSONEncoder().encode(recipes)
            try encodedData.write(to: recipesFileURL)
        }
        catch {
            fatalError( "An error occurred while saving recipes: \(error)")
        }
    }
    
        func loadRecipes() {  // Выгружает Data из папки, переводит в [Recipe], присваевает полученые данные recipes
            guard let data = try? Data(contentsOf: recipesFileURL) else { return }
            do {
              let savedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
              recipes = savedRecipes
            }
            catch {
              fatalError("An error occurred while loading recipes: \(error)")
            }
          }
    
    private var recipesFileURL: URL { // Создаёт и возвращает пустую папку "recipeData"
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appendingPathComponent("recipeData")
        }
        catch {
            fatalError("An error occurred while getting the url: \(error)")
        }
    }
}
