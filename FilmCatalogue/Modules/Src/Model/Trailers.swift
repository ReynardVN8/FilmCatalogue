//
//  Trailers.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation
import SwiftyJSON

struct TrailerHeaders: Codable{
    let result: [Trailer]
    
    init(_ json: JSON){
        result = json["results"].arrayValue.map{ Trailer($0) }
    }
}

struct Trailer: Codable, Identifiable{
    let id: String
    let name: String
    let key: String
    
    init(_ json: JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        key = json["key"].stringValue
    }
}


