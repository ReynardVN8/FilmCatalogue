//
//  Reviews.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation
import SwiftyJSON

struct ReviewHeaders: Codable{
    let results: [Review]
    let total_pages: Int
    
    init(_ json: JSON){
        results = json["results"].arrayValue.map { Review($0) }
        total_pages = json["total_pages"].intValue
    }
}

struct Review: Codable, Identifiable{
    let id: String
    let author: String
    let author_details: AuthorDetail
    let content: String
    let created_at: String
    let updated_at: String
    
    init(_ json: JSON){
        id = json["id"].stringValue
        author = json["author"].stringValue
        author_details = AuthorDetail(json["author_details"])
        content = json["content"].stringValue
        created_at = json["created_at"].stringValue
        updated_at = json["updated_at"].stringValue
    }
}

struct AuthorDetail: Codable{
    let name: String
    let username: String
    let avatar_path: String
    let rating: Double
    
    init(_ json: JSON){
        name = json["name"].stringValue
        username = json["username"].stringValue
        avatar_path = json["avatar_path"].stringValue
        rating = json["rating"].doubleValue
    }
}

