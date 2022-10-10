//
//  MainScreen.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var mainVM = MainViewModel()
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(){
        mainVM.getMovies(getMovieType: .NowPlaying)
        mainVM.getGenres()
//        mainVM.getMoviesByGenre(gerneID: 28)
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                if(mainVM.connectionStatus){
                    content
                } else {
                    internetError
                }
                
                VStack(alignment: .center){
                    HeaderMainScreen()
                    Spacer()
                }
            }
        }
    }
    
    var content: some View {
        ScrollView{
            Spacer()
                .frame(height: 70)
            LazyVGrid(columns: column, spacing: 20){
                ForEach(mainVM.movieDetails ?? []){ movies in
                    if(movies.id == mainVM.lastVideoID){
                        MovieGrid(id: movies.id, title: movies.title, poster: movies.poster_path,VM: mainVM , isLast: true)
                    } else {
                        MovieGrid(id: movies.id, title: movies.title, poster: movies.poster_path,VM: mainVM ,isLast: false)
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

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
