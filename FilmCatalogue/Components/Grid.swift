//
//  Grid.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import SwiftUI

let columnMain = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct Grid: View{
    var id: Int
    var title: String
    var poster: String
    
    var body: some View{
        NavigationLink {
            MovieInfoScreen(id: id)
        } label: {
            VStack(alignment: .center, spacing: 5){
                ImageLoader(type: .mediumPoster, image: poster)
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
