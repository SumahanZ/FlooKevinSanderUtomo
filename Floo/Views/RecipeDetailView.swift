//
//  RecipeDetailView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.purple)
                Text("Back")
                    .fontWeight(.light)
                    .padding(.leading, -5.0)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        ScrollView {
        VStack {
            Image("sushiroll")
                .resizable()
                .padding(.top, 0.0)
                .frame(height: nil)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
            
            HStack{
                Text("Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding([.top, .leading])
                    .frame(maxWidth: .infinity, alignment: .leading)
            
                    
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .padding(.trailing)
                    .frame(width: 30.0, height: 30.0)
            }
            
            Text("This is a great low-fat pasta dish. I serve it to company all the time. Serve with a fruit salad and French bread. ")
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
                        Text("200")
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
                        Text("47")
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
                        Text("758")
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
                        Text("467")
                            .fontWeight(.bold)
                            .padding(.trailing, 5.0)
                        VStack {
                            Text("Calcium")
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
                
                Text("1. 1/2 cup grated Parmesan Cheese")
                Text("2. 1/2 teaspoon crushed red pepper")
                Text("4. 1/2 cup grated Parmesan Cheese")
                Text("5. 1/2 cup grated Parmesan Cheese")
                Text("6. 1/2 cup grated Parmesan Cheese")
            }
            .padding([.top, .leading, .trailing], 5.0)
            .frame(maxWidth: .infinity, alignment: .center)
                
        }
        }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
