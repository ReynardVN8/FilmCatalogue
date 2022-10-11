//
//  CustomTabBar.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

struct DiscoverTabBar: View {
    var DVM: DiscoverViewModel
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .center, spacing: 10){
                ForEach(DVM.genre ?? []){ genre in
                    Button {
                        /*
                        DVM.genre?.removeAll()
                        DVM.gerneID = genre.id
                        DVM.getMoviesByGenre()
                         */
                    } label: {
                        Text(genre.name)
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold(genre.id == DVM.gerneID)
                            .underline(genre.id == DVM.gerneID)
                            .padding(10)
                            .cornerRadius(2)
                    }
                }
            }
        }
        .background(Color.darkGrey.gradient)
    }
}
