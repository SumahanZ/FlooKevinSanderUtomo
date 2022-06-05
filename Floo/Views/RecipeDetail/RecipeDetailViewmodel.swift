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
    
    public func containRecipeFavorite (recipeId: Int) -> Bool {
        favRecipeId.contains(recipeId)
    }
    
}
