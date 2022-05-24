//
//  MyRecipesView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct MyRecipesView: View {
    var body: some View {
        VStack {
            HStack{
            Text("My Recipes")
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            Spacer()
            }
            VStack{
                HStack{
                    Text("Favorites")
                        .font(.title)
                    .fontWeight(.semibold)
                    .padding([.top, .leading])
                Spacer()
                }
                ScrollView (.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<5) {i in
                        MyRecipesCard().padding([.leading, .bottom, .trailing], 10.0)
                    }
                }
            }
            }
            
            VStack{
                HStack{
                    Text("Saved Recipes")
                        .font(.title)
                    .fontWeight(.semibold)
                    .padding([.top, .leading])
                Spacer()
                }
                ScrollView (.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<5) {i in
                        MyRecipesCard().padding([.leading, .bottom, .trailing], 10.0)
                            
                    }
                }
            }
            }
            
            Button("Add Recipe") {
                
            }
            .padding(.all, 15.0)
            .frame(width: 350.0)
            .foregroundColor(.white)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            
            
    
            

            Spacer()
        }
        
    }
}

struct MyRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesView()
    }
}
