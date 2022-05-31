//
//  ExploreCard.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 23/05/22.
//

import SwiftUI

struct ExploreCard: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(15.0)
            .padding(5.0)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200.0,maxHeight: 200.0)
//            Image("sushiroll")
//                .resizable()
//                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                .frame(width: 164.0, height: 200.0)
//                .cornerRadius(15.0)
            Text(recipe.title ?? "")
                .font(.system(size: 12))
                .fontWeight(.bold)
                .padding(1.0)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.black)
            
                
        }
    }
}

//struct ExploreCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ExploreCard(recipe: Recipe())
//    }
//}
