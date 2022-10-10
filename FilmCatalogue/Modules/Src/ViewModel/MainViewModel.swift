//
//  MainViewModel.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation
import SwiftyJSON
import Alamofire

class MainViewModel: ObservableObject{
    @Published var movieListHeaders: MovieListHeaders?
    @Published var movieDetails: [MovieDetail]?
    @Published var moviesByGenre: [MovieDetail]?
    @Published var genreHeaders: GenreHeaders?
    @Published var genre: [Genre]?
    @Published var lastVideoID: Int = 0
    @Published var nextPage: Int = 1
    @Published var connectionStatus: Bool
    
    init(){
        self.connectionStatus = false
    }
    
    func getMovies(getMovieType: GetMovieType){
        var params = [String:String]()
        params["api_key"] = APIKey
        params["language"] = "en-US"
        params["page"] = "\(nextPage)"
        
        AF.request("\(baseApiURL)/movie\(getMovieType.rawValue)", method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default).response{ response in
            
            switch response.result{
            case .success:
                let json = try? JSON(data: response.data!)
                self.movieListHeaders = MovieListHeaders(json!)
                let oldMovieDetails = self.movieDetails ?? []
                self.movieDetails = (oldMovieDetails) + (self.movieListHeaders?.result ?? [])
                self.lastVideoID = (self.movieDetails?.last!.id)!
                self.nextPage += 1
                self.connectionStatus = true
                
            case let .failure(error):
                debugPrint(error)
                self.connectionStatus = false
            }
            
        }
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
                self.connectionStatus = true
                
            case let .failure(error):
                debugPrint(error)
                self.connectionStatus = false
            }
        }
    }
    
    func getMoviesByGenre(gerneID: Int){
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
                self.connectionStatus = true
                
            case let .failure(error):
                debugPrint(error)
                self.connectionStatus = false
            }
        }
    }
}

