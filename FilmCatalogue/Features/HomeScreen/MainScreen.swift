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
                Group{
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
                .toolbarBackground(Color.lightYellow, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.none, for: .tabBar)
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
