//
//  ExploreViewmodel.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 28/05/22.
//

import Foundation


class RecipeDetailViewmodel: ObservableObject {
    
    @Published var recipe: Recipe = Recipe()
   @Published var favRecipeId: [Int] = [Int]()
    @Published var myRecipes: [Recipe] = [Recipe]()
    @Published var isFavorite: Bool = false
    
    public func fetchRecipe(recipeId: Int) {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/\(recipeId)/information?apiKey=\(apiKey)&includeNutrition=true") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
            DispatchQueue.main.async { [self] in
                do {
                  let result = try JSONDecoder().decode(Recipe.self, from: data)
                    self.recipe = result
                    let str = recipe.summary?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                    self.recipe.summary = str
                    
                    let decoder = JSONDecoder()
                    if let data = UserDefaults.standard.value(forKey: "favRecipeId") as? Data {
                                let taskData = try? decoder.decode([Int].self, from: data)
                                favRecipeId = taskData ?? []
                            } else {
                                favRecipeId = []
                            }
                    
                    for i in favRecipeId {
                        if i == recipe.id {
                            self.isFavorite = true
                        }
                    }
                } catch let error {
                    print(error)
                }
            }

    }
    task.resume()
    }
    
    public func addRecipeFavorite (recipeId: Int) {
       
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "favRecipeId") as? Data {
                    let taskData = try? decoder.decode([Int].self, from: data)
                    favRecipeId = taskData ?? []
                } else {
                    favRecipeId = []
                }
        objectWillChange.send()
        favRecipeId = Array(Set(favRecipeId))
        favRecipeId.append(recipeId)
        favRecipeId = Array(Set(favRecipeId))
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favRecipeId) {
            UserDefaults.standard.set(encoded, forKey: "favRecipeId")
     }
    }
    
    public func removeRecipeFavorite (recipeId: Int) {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "favRecipeId") as? Data {
                    let taskData = try? decoder.decode([Int].self, from: data)
                    favRecipeId = taskData ?? []
                } else {
                    favRecipeId = []
                }
        objectWillChange.send()
        for (i, id) in favRecipeId.enumerated() {
            if (id == recipeId) {
                favRecipeId = Array(Set(favRecipeId))
                favRecipeId.remove(at: i)
                favRecipeId = Array(Set(favRecipeId))
            }
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favRecipeId) {
            UserDefaults.standard.set(encoded, forKey: "favRecipeId")
     }
    }
    
    public func removeSavedRecipes (recipeId: Int) {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "myRecipe") as? Data {
                    let taskData = try? decoder.decode([Recipe].self, from: data)
                    myRecipes = taskData ?? []
                } else {
                   myRecipes = []
        }

        objectWillChange.send()
        for (i, recipe) in myRecipes.enumerated() {
            if (recipeId == recipe.id) {
                myRecipes.remove(at: i)
            }
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(myRecipes) {
            UserDefaults.standard.set(encoded, forKey: "myRecipe")
     }
    }
    
    public func containRecipeFavorite (recipeId: Int) -> Bool {
        favRecipeId.contains(recipeId)
    }
    
}
