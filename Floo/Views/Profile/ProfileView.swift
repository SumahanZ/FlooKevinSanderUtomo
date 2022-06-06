//
//  ProfileView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = MyRecipesViewmodel()
    @StateObject var viewModelDetail = RecipeDetailViewmodel()
    @StateObject var user = ProfileViewmodel()
    var body: some View {
        NavigationView {
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
                Text(user.user.name )
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, -10.0)
                Text(user.user.title )
                    .font(.headline)
                    .foregroundColor(.white)
                
            }
        }
            VStack {
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
                        
                    Text(user.user.description)
                        .fontWeight(.light)
                        .padding(.horizontal, 10)
                        .padding(.top, 2.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    HStack {
                    Text("Speciality")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 10.0)
                    Spacer()
                    }
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(user.user.speciality , id: \.self) {speciality in
                        Text("\u{2022}" + speciality).padding(.horizontal, 10).padding(.top,3)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
                .padding(.top)
                    
                    Text("\(viewModel.myRecipes.count) recipes")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.top)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.myRecipes) {recipe in
                                    NavigationLink {
                                        RecipeDetailMyRecipesView(recipe: recipe)
                                    }label: {
                                        MyRecipesSavedCard(recipe: recipe)
                                    }
                                }
                            }
                        }
                        .onAppear {
                            viewModel.loadMyRecipes()
                            user.loadUserData()
                        }
                    NavigationLink(destination: ProfileEditView(user: $user.user)) {
                        Button {
                        } label: {
                            Text("Edit Profile")
                        }
                        .padding(.all, 15.0)
                        .frame(width: 350.0)
                        .foregroundColor(.white)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
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
}
