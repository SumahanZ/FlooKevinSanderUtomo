//
//  MyRecipesCard.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 17/05/22.
//

import SwiftUI

struct MyRecipesSavedCard: View {
    
    var recipe:Recipe
    var body: some View {
        VStack {
            
            Image("sushiroll")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 164, height: 200)
                    .cornerRadius(15)
                    .brightness(-0.2)
                    .overlay (alignment: .center) {
                        VStack{
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
            
            Text(recipe.cuisines?[0] ?? "")
                .fontWeight(.semibold)
    }

   }
}

struct MyRecipesSavedCard_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesSavedCard(recipe: Recipe())
    }
}

