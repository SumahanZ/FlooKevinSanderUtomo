//
//  RecipeDetailView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @StateObject var viewModel = RecipeDetailViewmodel()
    @EnvironmentObject var favorites : RecipeDetailViewmodel
    var id:Int
    var body: some View {
        ScrollView {
        VStack {
            AsyncImage(url: URL(string: viewModel.recipe.image ?? "")) { image in
                image
                    .resizable()
                    .frame(height: nil)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .padding(5)
            } placeholder: {
                ProgressView()
            }
          
            HStack{
                Text(viewModel.recipe.title ?? "None")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding([.top, .leading])
                    .frame(maxWidth: .infinity, alignment: .leading)
            
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(viewModel.isFavorite ? .red : .black    )
                    .padding(.trailing, 20)
                    .padding(.top)
                    .frame(width: 30.0, height: 30.0)
                    .onTapGesture {
                        if viewModel.isFavorite {
                            viewModel.isFavorite = false
                            viewModel.removeRecipeFavorite(recipeId: viewModel.recipe.id ??  -1)
                        } else {
                            viewModel.isFavorite = true
                            viewModel.addRecipeFavorite(recipeId: viewModel.recipe.id ?? -1)
                        }
                    }

            }
            
            Text(viewModel.recipe.summary ?? "None")
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text("Nutritions")
                .font(.title2)
                .fontWeight(.semibold)
                .padding([.top, .leading])
                .frame(maxWidth: .infinity, alignment: .leading)
                
            VStack {
                HStack {
                    HStack {
                        Text(String(format: "%.1f",viewModel.recipe.nutrition?.nutrients?[0].amount ?? 0))
                            .fontWeight(.bold)
                            .padding(.trailing, 5.0)
                        VStack {
                            Text("Calories")
                                .fontWeight(.bold)
                            HStack {
                            Text("Kcal")
                                .font(.body)
                                .fontWeight(.regular)
                            }
                        }
                    }
                    .frame(width: 171.0, height: 71.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                    .padding(.all, 5.0)
                    .cornerRadius(25)
                    
                    
                    HStack {
                        Text(String(format: "%.1f", viewModel.recipe.nutrition?.nutrients?[3].amount ?? 0))
                            .fontWeight(.bold)
                            .padding(.trailing, 5.0)
                        VStack {
                            Text("Carbo")
                                .fontWeight(.bold)
                            Text("Gram")
                                .font(.body)
                                .fontWeight(.regular)
                        }
                    }
                    .frame(width: 171.0, height: 71.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                    .padding(.all, 5.0)
                    .cornerRadius(25)
                    
                }
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                HStack {
                    HStack {
                        Text(String(format: "%.1f",viewModel.recipe.nutrition?.nutrients?[8].amount ?? 0))
                            .fontWeight(.bold)
                            .padding(.trailing, 5.0)
                        VStack {
                            Text("Protein")
                                .fontWeight(.bold)
                            Text("Gram")
                                .font(.body)
                                .fontWeight(.regular)
                        }
                    }
                    .frame(width: 171.0, height: 71.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
                    .padding(.all, 5.0)
                    .cornerRadius(25)
                    
                    
                    
                    HStack {
                        Text(String(format: "%.1f", viewModel.recipe.nutrition?.nutrients?[1].amount ?? 0))
                            .fontWeight(.bold)
                            .padding(.trailing, 5.0)
                        VStack {
                            Text("Fat")
                                .fontWeight(.bold)
                            Text("Gram")
                                .font(.body)
                                .fontWeight(.regular)
                        }
                    }
                    .frame(width: 171.0, height: 71.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.553, saturation: 1.0, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                    .padding(.all, 5.0)
                    .cornerRadius(25)
                }
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            }
            
            Text("Ingredients")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                ForEach(viewModel.recipe.extendedIngredients ?? [ExtendedIngredient]()) {ingredient in
                    Text("\u{2022} \(ingredient.original ?? "")")
                }
                
            }
            .padding([.top, .leading, .trailing], 5.0)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
                
        }
        }
        .onAppear {
            viewModel.fetchRecipe(recipeId: id)
        }
        }
    }

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(id: 187)
    }
}
