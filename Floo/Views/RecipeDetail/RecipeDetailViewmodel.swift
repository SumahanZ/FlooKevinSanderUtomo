//
//  ExploreViewmodel.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 28/05/22.
//

import Foundation


class RecipeDetailViewmodel: ObservableObject {
    
    @Published var recipe: Recipe = Recipe()
    
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
    
}
