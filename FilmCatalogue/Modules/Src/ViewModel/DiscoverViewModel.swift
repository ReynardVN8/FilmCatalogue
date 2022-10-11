//
//  DiscoverViewModel.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import Foundation
import SwiftyJSON
import Alamofire

class DiscoverViewModel: ObservableObject{
    @Published var movieListHeaders: MovieListHeaders?
    @Published var moviesByGenre: [MovieDetail]?
    @Published var genreHeaders: GenreHeaders?
    @Published var genre: [Genre]?
    @Published var gerneID: Int = 28
    @Published var lastVideoID: Int = 0
    @Published var nextPage: Int = 1
    @Published var discoverStatus: Bool
    
    init(){
        self.discoverStatus = false
    }
    
    func getGenres(){
        var params = [String:String]()
        params["api_key"] = APIKey
        params["language"] = "en-US"
        
        AF.request("\(baseApiURL)/genre/movie/list", method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default).response{ response in
            
            switch response.result{
            case .success:
                let json = try? JSON(data: response.data!)
                self.genreHeaders = GenreHeaders(json!)
                self.genre = (self.genreHeaders?.genres)
                self.discoverStatus = true
                
            case let .failure(error):
                debugPrint(error)
                self.discoverStatus = false
            }
        }
    }
    
    func getMoviesByGenre(){
        var params = [String:String]()
        params["api_key"] = APIKey
        params["language"] = "en-US"
        params["page"] = "\(nextPage)"
        params["with_genres"] = "\(gerneID)"
        
        AF.request("\(baseApiURL)/discover/movie", method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default).response{ response in
            
            switch response.result{
            case .success:
                let json = try? JSON(data: response.data!)
                self.movieListHeaders = MovieListHeaders(json!)
                let oldMoviesByGenre = self.moviesByGenre ?? []
                self.moviesByGenre = (oldMoviesByGenre) + (self.movieListHeaders?.result ?? [])
                self.lastVideoID = (self.moviesByGenre?.last!.id)!
                self.nextPage += 1
                self.discoverStatus = true
                
            case let .failure(error):
                debugPrint(error)
                self.discoverStatus = false
            }
        }
    }
}

