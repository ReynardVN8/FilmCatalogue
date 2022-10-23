//
//  MovieScreen.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import SwiftUI

struct MovieScreen: View {
    @ObservedObject var movieI = MovieInteractor()
    var mainP = MainPresenter()
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(){
        movieI.getMovies()
    }
    
    var body: some View {
        ZStack{
            VStack{
                if(movieI.movieStatus){
                    ZStack{
                        content
                    }
                } else {
                    internetError
                }
            }
            VStack(alignment: .center, spacing: 0){
                HeaderMainScreen()
                MovieTabBar(MI: movieI)
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
            LazyVGrid(columns: column, spacing: 10){
                ForEach(movieI.movieDetails ?? []){ movies in
                    Grid(id: movies.id, title: movies.title, poster: movies.poster_path)
                        .onAppear(){
                            if(mainP.isLastScreen(currentID: movies.id, lastID: movieI.lastVideoID, nextPage: movieI.nextPage, totalPage: movieI.movieListHeaders?.total_pages ?? 1)){
                                movieI.getMovies()
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

struct MovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
