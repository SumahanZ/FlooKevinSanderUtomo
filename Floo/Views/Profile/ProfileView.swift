//
//  ProfileView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ExploreViewmodel()
    
    var body: some View {
                
        VStack {
        ZStack {
            Image("recipe")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            VStack {
                Image("chef")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 146.0, height: 146.0)
                Text("Kenny Jinhiro")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, -10.0)
                Text("Home Chef")
                    .font(.headline)
                    .foregroundColor(.white)
                
            }
        }
            VStack {
                NavigationView {
                ScrollView {
                Text("Profile Information")
                    .font(.title3)
                    .foregroundColor(.purple)
                    .padding(.top)
                Divider()
                    .padding(.horizontal, -10.0)
                    .frame(width: 100.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
                    .offset(y: -6)
                VStack {
                    HStack {
                    Text("About")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 10.0)
                    Spacer()
                    }
                        
                    Text("After attending computer science school, I am interested in cooking food especially Indian food. Prata bread and butter chicken are my favourite foods")
                        .font(.body)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 2.0)
                        .fixedSize(horizontal: false, vertical: true)
                
                VStack {
                    HStack {
                    Text("Speciality")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 10.0)
                    Spacer()
                    }
                VStack {
                    HStack {
                    Text("Butter Chicken, Fish Curry, Kofta, Prata Bread")
                        .font(.body)
                        .fontWeight(.light)
                        .padding(.top, 2.0)
                        .padding([.leading], 10.0)
                    Spacer()
                    }
                }
                }
                .padding(.top)
                    
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.recipes) {recipe in
                                    NavigationLink {
                                        RecipeDetailView(id: recipe.id ?? -1)
                                    }label: {
                                        ProfileRecipeCard(recipe: recipe)
                                    }
                                }
                            }
                        }
                        .navigationTitle("\(viewModel.recipes.count)")
                        .onAppear {
                            viewModel.fetchRecipe()
                        }
                
          }
      }
                }
            
             
            .background(Color.white.edgesIgnoringSafeArea(.bottom))
            .cornerRadius(10)
            .offset(y: -65)
            .ignoresSafeArea()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
