//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var name:String = ""
    @State private var description:String = ""
    @State private var nationality:String = ""
    @State private var calories:String = ""
    @State private var carbo:String = ""
    @State private var protein:String = ""
    @State private var calcium:String = ""
    @State private var ingredient:String = ""
    @State private var amount:String = ""
    @State private var unit:String = ""
    
    
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
            
        Text("Add Recipe")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding([.top, .leading])
                .frame(maxWidth: .infinity, alignment: .leading)
        ScrollView {
            VStack {
                VStack {
                    Text("General")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                TextField("Name", text: $name)
                        .padding(.horizontal, 30).padding(.trailing, 20)
                Divider()
                 .padding(.horizontal, 30)
                
                TextField("Description", text: $name)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    
                Divider()
                 .padding(.horizontal, 30)
                
                TextField("Nationality / Origin", text: $name)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                Divider()
                 .padding(.horizontal, 30)
                
                }
                .padding(.top)
                
                
                VStack {
                    Text("Nutritions")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Calories (Kcal)", text: $name)
                        .padding(.horizontal, 30)
                    Divider()
                     .padding(.horizontal, 30)
                    
                    TextField("Carbohydrates (Gram)", text: $name)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                    
                    TextField("Protein (Gram)", text: $name)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                    TextField("Calcium (Gram)", text: $name)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                }
                .padding(.vertical)
                
                
                
                VStack {
                    Text("Ingredients")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        VStack {
                        TextField("Ingredient 1", text: $name)
                                .padding(.trailing, 30).padding(.trailing, 20).frame(width: 200.0)
                        Divider()
                                .padding(.trailing, 30)
                                .frame(width: 200.0)
                        }
                        
                        VStack {
                            
                        VStack {
                        TextField("Amount", text: $name)
                                .padding(.trailing, 30).padding(.trailing, 20).frame(width: 120.0).font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                        Divider()
                                .padding(.trailing, 30)
                            .frame(width: 120.0)
                        }
                        
                        VStack {
                        TextField("Unit", text: $name)
                                .padding(.trailing, 30).padding(.trailing, 20).frame(width: 120.0).font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                        Divider()
                                .padding(.trailing, 30)
                            .frame(width: 120.0)
                        }
            
                        }
                        
                    }
                    Button{
                        
                    }label : {
                        Text("Add More Ingredients")
                    }
                    .padding(.all, 15.0)
                    .frame(maxWidth: 240, alignment: .center)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .padding(.all, 15.0)
    
                }
                
            }
        }
            
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
