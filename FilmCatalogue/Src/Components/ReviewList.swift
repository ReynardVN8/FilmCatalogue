//
//  ReviewList.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation
import SwiftUI

struct ReviewList: View{
    var authorDetail: AuthorDetail
    var content: String
    var createdAt: String
    
    init(authorDetail: AuthorDetail, content: String, createdAt: String) {
        self.authorDetail = authorDetail
        self.content = content
        self.createdAt = createdAt
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 12.5){
            HStack(){
                KFI(type: .smallPoster, image: authorDetail.avatar_path)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(radius: 1)
                    .overlay(Circle().stroke(Color.green, lineWidth: 2))
                VStack(alignment: .leading, spacing: 5){
                    Text("\(authorDetail.username) - \(createdAt)")
                        .foregroundColor(.white)
                    Text("Rated: \(authorDetail.rating.toString1Decimal())")
                        .foregroundColor(.white)
                }
            }
                .padding(3)
            Divider()
                .frame(height: 1)
                .background(Color.white)
            Text(content)
                .foregroundColor(.white)
            Divider()
                .frame(height: 2)
                .background(Color.white)
        }
            .padding(.bottom, 2)
    }
}
