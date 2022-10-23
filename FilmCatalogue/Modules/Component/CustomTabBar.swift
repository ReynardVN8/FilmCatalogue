//
//  CustomTabBar.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

//MARK: Janky
struct MovieTabBar: View{
    var MI: MovieInteractor
    
    var body: some View{
        ScrollView(.horizontal){
            HStack(alignment: .center, spacing: 10){
                Button {
                    MI.movieDetails?.removeAll()
                    MI.nextPage = 1
                    MI.movieType = .NowPlaying
                    MI.getMovies()
                } label: {
                    Text("Now Playing")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(10)
                        .cornerRadius(2)
                }
                
                Button {
                    MI.movieDetails?.removeAll()
                    MI.nextPage = 1
                    MI.movieType = .Popular
                    MI.getMovies()
                } label: {
                    Text("Popular")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(10)
                        .cornerRadius(2)
                }
                
                Button {
                    MI.movieDetails?.removeAll()
                    MI.nextPage = 1
                    MI.movieType = .Upcoming
                    MI.getMovies()
                } label: {
                    Text("Upcoming")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(10)
                        .cornerRadius(2)
                }
                
                Button {
                    MI.movieDetails?.removeAll()
                    MI.nextPage = 1
                    MI.movieType = .TopRated
                    MI.getMovies()
                } label: {
                    Text("Top Rated")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(10)
                        .cornerRadius(2)
                }
            }
        }
        .background(Color.darkGrey.gradient)
    }
}

struct DiscoverTabBar: View {
    var DI: DiscoverInteractor
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .center, spacing: 10){
                ForEach(DI.genre ?? []){ genre in
                    Button {
                        DI.moviesByGenre?.removeAll()
                        DI.nextPage = 1
                        DI.currentGenre = genre.id
                        DI.getMoviesByGenre()
                    } label: {
                        Text(genre.name)
                            .font(.title3)
                            .foregroundColor(.white)
//                            .bold(genre.id == DI.gerneID)
//                            .underline(genre.id == DI.gerneID)
                            .padding(10)
                            .cornerRadius(2)
                    }
                }
            }
        }
        .background(Color.darkGrey.gradient)
    }
}
