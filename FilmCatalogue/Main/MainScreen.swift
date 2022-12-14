//
//  MainScreen.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationStack{
            TabView{
                MovieScreen()
                    .tabItem{
                        Image(systemName: "film.circle")
                        Text("Film")
                    }
                
                DiscoverScreen()
                    .tabItem{
                        Image(systemName: "magnifyingglass.circle")
                        Text("Discover")
                    }
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
