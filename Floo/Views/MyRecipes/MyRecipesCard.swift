//
//  MyRecipesCard.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 17/05/22.
//

import SwiftUI

struct MyRecipesCard: View {
    
    var recipe:Recipe
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 164, height: 200)
                    .cornerRadius(15)
                    .brightness(-0.2)
                    .overlay (alignment: .center) {
                        VStack{
                            HStack{
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                    .padding([.top, .trailing], 10.0)
                            }
                            Spacer()
                            Text(recipe.title ?? "")
                                .font(Font.custom("Inter-Thin", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom)
                            Spacer()
                        }
                    }
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView()
            }
    }

   }
}

struct MyRecipesCard_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesCard(recipe: Recipe())
    }
}
