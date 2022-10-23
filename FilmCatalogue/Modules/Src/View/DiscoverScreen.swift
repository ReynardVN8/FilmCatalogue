//
//  DiscoverScreen.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import SwiftUI

struct DiscoverScreen: View {
    @ObservedObject var discoverI = DiscoverInteractor()
    var mainP = MainPresenter()
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(){
        discoverI.getGenres()
        discoverI.getMoviesByGenre()
    }
    
    var body: some View {
        ZStack{
            VStack{
                if(discoverI.discoverStatus){
                    content
                } else {
                    internetError
                }
            }
            VStack(alignment: .center, spacing: 0){
                HeaderMainScreen()
                DiscoverTabBar(DI: discoverI)
                Spacer()
                Color.lightYellow
                    .frame(height: 90)
            }
                .ignoresSafeArea(edges: .bottom)
        }
    }
    
    var content: some View{
        ScrollView{
            Spacer()
                .frame(height: 110)
            LazyVGrid(columns: column, spacing: 20){
                ForEach(discoverI.moviesByGenre ?? []){ movies in
                    Grid(id: movies.id, title: movies.title, poster: movies.poster_path)
                        .onAppear(){
                            if(mainP.isLastScreen(currentID: movies.id, lastID: discoverI.lastVideoID, nextPage: discoverI.nextPage, totalPage: discoverI.movieListHeaders?.total_pages ?? 1)){
                                discoverI.getMoviesByGenre()
                            }
                        }
                }
            }
        }
            .background(Color.black)
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

struct DiscoverScreen_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverScreen()
    }
}
