//
//  ExploreViewmodel.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 28/05/22.
//

import Foundation

var apiKey = "308a67cc457b41d48d54130b834efa63"
class ExploreViewmodel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipe() {
            guard let url = URL(string: "https://api.spoonacular.com/recipes/random?apiKey=\(apiKey)&number=10") else { return }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
                DispatchQueue.main.async { [self] in
                    do {
                      let result = try JSONDecoder().decode(RecipeAll.self, from: data)
                        self.recipes = result.recipes
                    } catch let error {
                        print(error)
                    }
                }

        }
        task.resume()
}
    
    func getRecipeBySearch (query:String) {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&query=\(query)&number=10") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let result = try JSONDecoder().decode(RecipeByQuery.self, from: data)
                    self.recipes = result.results
                } catch let error {
                    print(error)
                }
            }

    }
    task.resume()
    }
}

