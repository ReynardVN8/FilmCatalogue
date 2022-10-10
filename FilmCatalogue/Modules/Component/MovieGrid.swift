//
//  MovieGrid.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

struct MovieGrid: View{
    var id: Int
    var title: String
    var poster: String
    var VM: MainViewModel
    var isLast: Bool
    
    var body: some View{
        NavigationLink {
            MovieInfoScreen(id: id)
        } label: {
            if(isLast){
                VStack(alignment: .center, spacing: 5){
                    KFI(type: .mediumPoster, image: poster)
                        .aspectRatio(2/3, contentMode: .fit)
                    Text(title)
                        .font(.body)
                        .foregroundColor(.white)
                    Spacer()
                }
                    .padding(12)
                    .background(Color.darkGrey.gradient)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    .onAppear(){
                        if(VM.nextPage < VM.movieListHeaders?.total_pages ?? 1){
                            VM.getMovies(getType: .Movie, getMovieType: .NowPlaying)
                        }
                    }
            } else {
                VStack(alignment: .center, spacing: 5){
                    KFI(type: .mediumPoster, image: poster)
                        .aspectRatio(2/3, contentMode: .fit)
                    Text(title)
                        .font(.body)
                        .foregroundColor(.white)
                    Spacer()
                }
                    .padding(12)
                    .background(Color.darkGrey.gradient)
                    .cornerRadius(5)
                    .shadow(radius: 5)
            }
        }
    }
}
