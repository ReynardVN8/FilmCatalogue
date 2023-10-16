//
//  MovieViewModel.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import Foundation
import SwiftyJSON
import Alamofire

class MovieViewModel: ObservableObject{
    @Published var movieListHeaders: MovieListHeaders?
    @Published var movieDetails: [MovieDetail]?
    @Published var movieType: GetMovieType = .NowPlaying
    @Published var lastVideoID: Int = 0
    @Published var nextPage: Int = 1
    @Published var movieStatus: Bool
    
    init(){
        self.movieStatus = false
    }
    
    func getMovies(){
        var params = [String:String]()
        params["api_key"] = APIKey
        params["language"] = "en-US"
        params["page"] = "\(nextPage)"
        
        AF.request("\(baseApiURL)/movie\(movieType.rawValue)", method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default).response{ response in
            
            switch response.result{
            case .success:
                let json = try? JSON(data: response.data!)
                self.movieListHeaders = MovieListHeaders(json!)
                let oldMovieDetails = self.movieDetails ?? []
                self.movieDetails = (oldMovieDetails) + (self.movieListHeaders?.result ?? [])
                self.lastVideoID = (self.movieDetails?.last!.id)!
                self.nextPage += 1
                self.movieStatus = true
                
            case let .failure(error):
                debugPrint(error)
                self.movieStatus = false
            }
            
        }
    }
}

