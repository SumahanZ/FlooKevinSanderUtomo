//
//  ExploreCard.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 23/05/22.
//

import SwiftUI

struct ExploreCard: View {
    var body: some View {
        VStack {
            Image("sushiroll")
                .resizable()
                .frame(width: 160.0, height: 200.0)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .cornerRadius(15.0)
            Text("Cucumber & Tomato Gimbap")
                .font(.system(size: 12))
                .padding(1.0)
                .frame(maxWidth: 162, alignment: .center)
            
                
        }
    }
}

struct ExploreCard_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCard()
    }
}
