//
//  DiscoverScreen.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import SwiftUI

struct DiscoverScreen: View {
    @ObservedObject var discoverVM = DiscoverViewModel()
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(){
        discoverVM.getGenres()
        discoverVM.getMoviesByGenre(gerneID: 28)
    }
    
    var body: some View {
        VStack{
            if(discoverVM.discoverStatus){
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
                ForEach(discoverVM.moviesByGenre ?? []){ movies in
                    if(movies.id == discoverVM.lastVideoID){
                        DiscoverGrid(id: movies.id, title: movies.title, poster: movies.poster_path, DVM: discoverVM , isLast: true)
                    } else {
                        DiscoverGrid(id: movies.id, title: movies.title, poster: movies.poster_path, DVM: discoverVM ,isLast: false)
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
