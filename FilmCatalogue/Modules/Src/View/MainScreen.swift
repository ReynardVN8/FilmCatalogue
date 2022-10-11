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
                ZStack{
                    MovieScreen()
                    VStack(alignment: .center){
                        HeaderMainScreen()
                        Spacer()
                    }
                }
                    .tabItem{
                        Image(systemName: "film.circle")
                        Text("Film")
                    }
                
                ZStack{
                    DiscoverScreen()
                    VStack(alignment: .center){
                        HeaderMainScreen()
                        Spacer()
                    }
                }
                    .tabItem{
                        Image(systemName: "magnifyingglass.circle")
                        Text("Discover")
                    }
            }
        }
    }
    
    var internetError: some View{
        HStack(alignment: .center){
            Spacer()
            VStack(alignment: .center, spacing: 10){
                Spacer()
                Text("There's something wrong with the connection")
                    .font(.body)
                    .foregroundColor(.lightGrey)
                Text("Please check your internet connection")
                    .font(.body)
                    .foregroundColor(.lightGrey)
                Spacer()
            }
            Spacer()
        }
            .background(Color.black)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
