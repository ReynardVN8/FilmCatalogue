//
//  CustomTabBar.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

struct CustomTabBar: View {
    var VM: MainViewModel
    var currentGenre: Int
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .center, spacing: 10){
                ForEach(VM.genre ?? []){ genre in
                    Text(genre.name)
                        .font(.title3)
                        .foregroundColor(.white)
                        .bold(genre.id == currentGenre)
                        .underline(genre.id == currentGenre)
                        .cornerRadius(2)
                        .onTapGesture {
                            VM.genre?.removeAll()
                            VM.getMoviesByGenre(gerneID: genre.id)
                        }
                }
            }
        }
            .background(Color.darkGrey)
    }
}
