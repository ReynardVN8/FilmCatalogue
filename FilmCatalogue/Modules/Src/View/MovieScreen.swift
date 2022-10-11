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
        VStack{
            if(movieVM.movieStatus){
                content
            } else {
                internetError
            }
        }
    }
    
    var content: some View{
        ScrollView{
            Spacer()
                .frame(height: 70)
            LazyVGrid(columns: column, spacing: 20){
                ForEach(movieVM.movieDetails ?? []){ movies in
                    if(movies.id == movieVM.lastVideoID){
                        MovieGrid(id: movies.id, title: movies.title, poster: movies.poster_path, MVM: movieVM, isLast: true)
                    } else {
                        MovieGrid(id: movies.id, title: movies.title, poster: movies.poster_path, MVM: movieVM, isLast: false)
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
