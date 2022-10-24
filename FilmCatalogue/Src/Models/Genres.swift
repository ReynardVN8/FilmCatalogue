//
//  Genres.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation
import SwiftyJSON

struct GenreHeaders: Codable{
    let genres: [Genre]
    
    init(_ json: JSON){
        genres = json["genres"].arrayValue.map{ Genre($0) }
    }
}

struct GenreID: Codable, Identifiable{
    let id: Int
    
    init(_ json: JSON){
        id = json.intValue
    }
}

struct Genre: Codable, Identifiable{
    let id: Int
    let name: String
    
    init(_ json: JSON){
        id = json["id"].intValue
        name = json["name"].stringValue
    }
}

