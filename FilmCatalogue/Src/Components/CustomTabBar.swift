//
//  CustomTabBar.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

struct MovieTabBar: View{
    @State var currentType: GetMovieType
    var AllMovieType: [GetMovieType] = [.NowPlaying, .Popular, .Upcoming, .TopRated]
    var MVM: MovieViewModel
    
    init(MVM: MovieViewModel) {
        self.MVM = MVM
        self.currentType = MVM.movieType
    }
    
    var body: some View{
        ScrollView(.horizontal){
            HStack(alignment: .center, spacing: 10){
                ForEach(AllMovieType, id: \.self){ type in
                    Button {
                        MVM.movieDetails?.removeAll()
                        MVM.nextPage = 1
                        MVM.movieType = type
                        currentType = type
                        MVM.getMovies()
                    } label: {
                        Text(MVM.loadTypeTabBar(type))
                            .font(.title3)
                            .foregroundColor(.white)
                            .underline(currentType == type)
                            .padding(10)
                            .cornerRadius(2)
                    }
                }
            }
        }
        .background(Color.darkGrey.gradient)
    }
}

struct DiscoverTabBar: View {
    @State var currentGenre: Int
    var DVM: DiscoverViewModel
    
    init(DVM: DiscoverViewModel) {
        self.DVM = DVM
        self.currentGenre = DVM.currentGenre
    }
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .center, spacing: 10){
                ForEach(DVM.genre ?? []){ genre in
                    Button {
                        DVM.moviesByGenre?.removeAll()
                        DVM.nextPage = 1
                        DVM.currentGenre = genre.id
                        currentGenre = genre.id
                        DVM.getMoviesByGenre()
                    } label: {
                        Text(genre.name)
                            .font(.title3)
                            .foregroundColor(.white)
                            .underline(currentGenre == genre.id)
                            .padding(10)
                            .cornerRadius(2)
                    }
                }
            }
        }
        .background(Color.darkGrey.gradient)
    }
}
