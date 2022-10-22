//
//  MovieScreen.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import SwiftUI

struct MovieScreen: View {
    @ObservedObject var movieVM = MovieViewModel()
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(){
        movieVM.getMovies()
    }
    
    var body: some View {
        ZStack{
            VStack{
                if(movieVM.movieStatus){
                    content
                } else {
                    internetError
                }
            }
            VStack(alignment: .center, spacing: 0){
                HeaderMainScreen()
                MovieTabBar(MVM: movieVM)
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
                ForEach(movieVM.movieDetails ?? []){ movies in
                    Grid(id: movies.id, title: movies.title, poster: movies.poster_path)
                        .onAppear(){
                            if(movies.id == movieVM.lastVideoID && movieVM.nextPage <= movieVM.movieListHeaders?.total_pages ?? 1){
                                movieVM.getMovies()
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
