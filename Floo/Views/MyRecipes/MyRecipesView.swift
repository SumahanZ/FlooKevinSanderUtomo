//
//  MyRecipesView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct MyRecipesView: View {
    
    @StateObject var viewModel = MyRecipesViewmodel()
    @StateObject var viewModelDetail = RecipeDetailViewmodel()
    
    var body: some View {
        NavigationView {
        VStack {
            ScrollView {
                HStack{
                Text("My Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Spacer()
                }
            VStack{
                HStack{
                    Text("Favorites")
                        .font(.title)
                        .fontWeight(.medium)
                    .padding([.top, .leading])
                Spacer()
                }
                ScrollView (.horizontal, showsIndicators: false){
                HStack{
                    ForEach(viewModel.favRecipes) {recipe in
                        NavigationLink {
                            RecipeDetailView(id: recipe.id ?? -1)
                        }label: {
                            MyRecipesCard(recipe: recipe)
                        }
                    }
                    
                }
            }
            }
            
            VStack{
                HStack{
                    Text("Saved Recipes")
                        .font(.title)
                        .fontWeight(.medium)
                    .padding([.top, .leading])
                Spacer()
                }
                ScrollView (.horizontal){
                HStack{
                    ForEach(viewModel.myRecipes) {recipe in
                        NavigationLink {
                            RecipeDetailMyRecipesView(recipe: recipe)
                        }label: {
                            MyRecipesSavedCard(recipe: recipe)
                        }
                    }
                }
            }
                
                NavigationLink(destination: AddRecipeView()) {
                    Button {
                    } label: {
                        Text("Add Recipe")
                    }
                    .padding(.all, 15.0)
                    .frame(width: 350.0)
                    .foregroundColor(.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                }
            }
            Spacer()
        }
        
    }
        .onAppear {
            viewModel.loadFavRecipes()
            viewModel.loadMyRecipes()
        }
    }
        .environmentObject(viewModel)
}
}


struct MyRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesView()
    }
}
