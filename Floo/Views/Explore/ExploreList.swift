//
//  ExploreView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ExploreList: View {
    
    @StateObject var viewModel = ExploreViewmodel()
    @StateObject var viewModelDetail = RecipeDetailViewmodel()
    
    @State private var search: String = ""
    
    var filteredRecipes: [Recipe] {
        if search.count == 0 {
            return viewModel.recipes
        }else {
            return viewModel.recipes.filter {$0.title!.contains(search)}
        }
    }
    
    var body: some View {
            NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(filteredRecipes) {recipe in
                    NavigationLink {
                        RecipeDetailView(id: recipe.id ?? -1)
                    }label: {
                        ExploreCard(recipe: recipe)
                    }
                }
            }
            .padding(.top)
        }
        .searchable(text: $search)
        .onSubmit(of: .search, {
            viewModel.getRecipeBySearch(query: search)
        })
        .onChange(of: search, perform: { search in
            if (search == "") {
                viewModel.fetchRecipe()
            }
        })
        .navigationTitle("Explore Recipes")
        .onAppear {
           viewModel.fetchRecipe()
          }
       }
    }
}


struct ExploreList_Previews: PreviewProvider {
    static var previews: some View {
        ExploreList()
    }
}

