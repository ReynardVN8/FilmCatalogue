//
//  CustomTabBar.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

//MARK: Janky
struct MovieTabBar: View{
    var MVM: MovieViewModel
    
    var body: some View{
        ScrollView(.horizontal){
            HStack(alignment: .center, spacing: 10){
                Button {
                    MVM.movieDetails?.removeAll()
                    MVM.nextPage = 1
                    MVM.movieType = .NowPlaying
                    MVM.getMovies()
                } label: {
                    Text("Now Playing")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(10)
                        .cornerRadius(2)
                }
                
                Button {
                    MVM.movieDetails?.removeAll()
                    MVM.nextPage = 1
                    MVM.movieType = .Popular
                    MVM.getMovies()
                } label: {
                    Text("Popular")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(10)
                        .cornerRadius(2)
                }
                
                Button {
                    MVM.movieDetails?.removeAll()
                    MVM.nextPage = 1
                    MVM.movieType = .Upcoming
                    MVM.getMovies()
                } label: {
                    Text("Upcoming")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(10)
                        .cornerRadius(2)
                }
                
                Button {
                    MVM.movieDetails?.removeAll()
                    MVM.nextPage = 1
                    MVM.movieType = .TopRated
                    MVM.getMovies()
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
    var DVM: DiscoverViewModel
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .center, spacing: 10){
                ForEach(DVM.genre ?? []){ genre in
                    Button {
                        DVM.moviesByGenre?.removeAll()
                        DVM.nextPage = 1
                        DVM.currentGenre = genre.id
                        DVM.getMoviesByGenre()
                    } label: {
                        Text(genre.name)
                            .font(.title3)
                            .foregroundColor(.white)
//                            .bold(genre.id == DVM.gerneID)
//                            .underline(genre.id == DVM.gerneID)
                            .padding(10)
                            .cornerRadius(2)
                    }
                }
            }
        }
        .background(Color.darkGrey.gradient)
    }
}
