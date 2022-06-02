//
//  MyRecipesViewmodel.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 28/05/22.
//

import Foundation


class MyRecipesViewmodel : ObservableObject {
    @Published var myRecipes: [Recipe] = []
    @Published var favRecipeId: [Int] = [Int]()
    @Published var favRecipes: [Recipe] = []
    
    func loadFavRecipes () {
        var favoriteQuery = ""
        
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "favRecipeId") as? Data {
                    let taskData = try? decoder.decode([Int].self, from: data)
                    favRecipeId = taskData ?? []
                } else {
                   favRecipeId = []
                }
        
        for(i,id) in favRecipeId.enumerated() {
            if (i == (favRecipeId.count - 1)) {
                favoriteQuery = favoriteQuery + String(id)
            }else {
                favoriteQuery = favoriteQuery + String(id) + ","
            }
        }
        
        guard let url = URL(string: "https://api.spoonacular.com/recipes/informationBulk?apiKey=\(apiKey)&ids=\(favoriteQuery)") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
            DispatchQueue.main.async { [self] in
                do {
                  let result = try JSONDecoder().decode(RecipeAll.self, from: data)
                    self.favRecipes = result.recipes
                } catch let error {
                    print(error)
                }
            }

       }
        task.resume()
    }
    
    func loadMyRecipes () {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "myRecipes") as? Data {
                    let taskData = try? decoder.decode([Recipe].self, from: data)
                    myRecipes = taskData ?? []
                } else {
                   myRecipes = []
        }
    }
}
