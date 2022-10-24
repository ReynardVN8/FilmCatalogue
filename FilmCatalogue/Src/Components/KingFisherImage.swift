//
//  KingFisherImage.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI
import Kingfisher

struct KFI: View {
    var type: GetImageType
    var image: String
    
    var body: some View {
        KFImage(URL(string: "\(baseImageURL)\(type.rawValue)\(image)"))
            .resizable()
    }
}
