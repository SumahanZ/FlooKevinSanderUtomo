//
//  ContentView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                ExploreList()
                    .tabItem {
                        Image(systemName: "globe.asia.australia.fill")
                        Text("Explore")
                    }
                MyRecipesView()
                    .tabItem {
                        Image(systemName: "menucard.fill")
                        Text("My Recipes")
                        
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profile")
                        
                    }
            }
        }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
