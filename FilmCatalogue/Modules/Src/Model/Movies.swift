//
//  Movies.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation
import SwiftyJSON

struct MovieListHeaders: Codable{
    let result: [MovieDetail]
    let total_pages: Int
    
    init(_ json: JSON){
        result = json["results"].arrayValue.map{ MovieDetail($0) }
        total_pages = json["total_pages"].intValue
    }
}

struct MovieDetail: Codable, Identifiable{
    let id: Int
    let title: String
    let poster_path: String
    let backdrop_path: String
    let genre_ids: [GenreID]
    let genres: [Genre]
    let overview: String
    let runtime: Int
    let homepage: String
    let release_date: String
    let vote_average: Double
    
    init(_ json: JSON){
        id = json["id"].intValue
        title = json["original_title"].stringValue
        poster_path = json["poster_path"].stringValue
        backdrop_path = json["backdrop_path"].stringValue
        genre_ids = json["genre_ids"].arrayValue.map { GenreID($0) }
        genres = json["genres"].arrayValue.map{ Genre($0) }
        overview = json["overview"].stringValue
        runtime = json["runtime"].intValue
        homepage = json["homepage"].stringValue
        release_date = json["release_date"].stringValue
        vote_average = json["vote_average"].doubleValue
    }
}
