//
//  ProfileRecipeCard.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 25/05/22.
//

import SwiftUI

struct ProfileRecipeCard: View {
    let recipe: Recipe
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100.0,maxHeight: 100.0)
                    .cornerRadius(20)

            } placeholder: {
                ProgressView()
            }
            .overlay (alignment: .center) {
                VStack{
                    Spacer()
                    Text(recipe.title ?? "")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Spacer()
                }
            }
            .shadow(radius: 5)

    }
    }
}

struct ProfileRecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRecipeCard(recipe: Recipe())
    }
}
