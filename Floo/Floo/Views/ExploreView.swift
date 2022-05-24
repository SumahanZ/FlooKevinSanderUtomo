//
//  ExploreView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ExploreView: View {
//    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text("Explore Recipes")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName: "arrow.right")
                    .padding(.trailing, 20.0)
                Text("Find out what you love!")
                    .font(.caption)
                Spacer()
            }
            .padding()
            .frame(width: 345.0, height: 55.0)
            .background(Color(.systemGray6))
            
            .cornerRadius(25)

                
            
        NavigationView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: -25)], spacing: 10) {
//            List(viewModel.results, id: \.id) { recipe in
//                NavigationLink {
//                    RecipeDetailView()
//                } label: {
//                    Text(recipe.title)
//                }
//            }
//            .navigationTitle("Explore Recipes")
//            .onAppear{
//                viewModel.loadData()
//            }
                ForEach(0..<6) {i in
                    ExploreCard()
                        .padding(.horizontal)
                }
            }
            .padding(.top)
        }
            
    }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
