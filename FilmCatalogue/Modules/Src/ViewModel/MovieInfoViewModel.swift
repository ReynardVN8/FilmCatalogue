//
//  MovieInfoViewModel.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation
import SwiftyJSON
import Alamofire

class MovieInfoViewModel: ObservableObject{
    @Published var trailerHeaders: TrailerHeaders?
    @Published var trailer: [Trailer]?
    @Published var movieInfo: MovieDetail?
    @Published var genres: [Genre]?
    @Published var reviewHeaders: ReviewHeaders?
    @Published var review: [Review]?
    @Published var authors: [AuthorDetail]?
    @Published var trailerStatus: Bool = false
    @Published var descriptionStatus: Bool = false
    @Published var reviewStatus: Bool = false
    @Published var youtubeKey: String?
    @Published var releasedDate: String = ""
    @Published var rating: String = ""
    
    init(){
        trailerStatus = false
        descriptionStatus = false
        reviewStatus = false
    }
    
    func getTrailer(movieID: Int){
        var params = [String:String]()
        params["api_key"] = APIKey
        params["language"] = "en-US"
        
        AF.request("\(baseApiURL)/movie/\(movieID)/videos", method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default).response { response in
            
            switch response.result{
            case .success:
                let json = try? JSON(data: response.data!)
                self.trailerHeaders = TrailerHeaders(json!)
                self.trailer = (self.trailerHeaders?.result)
                
                if let trailer = self.trailer?.first(where: {$0.name == "Official Trailer"}){
                    self.youtubeKey = trailer.key
                    self.trailerStatus = true
                } else if let trailer = self.trailer?.first(where: {$0.name == "Teaser"}) {
                    self.youtubeKey = trailer.key
                    self.trailerStatus = true
                } else {
                    self.trailerStatus = false
                }
                
            case let.failure(error):
                debugPrint(error)
                self.trailerStatus = false
            }
        }
    }
    
    func getDetailedMovie(movieID: Int){
        var params = [String:String]()
        params["api_key"] = APIKey
        params["language"] = "en-US"
        
        AF.request("\(baseApiURL)/movie/\(movieID)", method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default).response{ response in
            
            switch response.result{
            case .success:
                let json = try? JSON(data: response.data!)
                self.movieInfo = MovieDetail(json!)
                self.genres = (self.movieInfo?.genres)
                self.releasedDate = self.convertToReleasedDate(self.movieInfo?.release_date ?? "")
                self.rating = self.movieInfo?.vote_average.toString1Decimal() ?? "No Rating"
                self.descriptionStatus = true
                
            case let .failure(error):
                debugPrint(error)
                self.descriptionStatus = false
            }
        }
    }
    
    func getReview(movieID: Int, page: Int){
        var params = [String:String]()
        params["api_key"] = APIKey
        params["language"] = "en-US"
        params["page"] = "\(page)"
        
        AF.request("\(baseApiURL)/movie/\(movieID)/reviews", method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default).response { response in
            
            switch response.result{
            case .success:
                let json = try? JSON(data: response.data!)
                self.reviewHeaders = ReviewHeaders(json!)
                self.review = (self.reviewHeaders?.results)
                if(self.review!.isEmpty){
                    self.reviewStatus = false
                } else {
                    self.reviewStatus = true
                }
            case let.failure(error):
                debugPrint(error)
                self.reviewStatus = false
            }
        }
    }
    
    func convertToReleasedDate(_ DateInString: String) -> String{
        let tempDate = DateInString.toDate("yyyy-MM-dd")
        return tempDate?.toString("MMM dd, yyyy") ?? "Not Yet Released"
    }
    
    func convertToCreatedDate(_ DateInString: String) -> String{
        let tempDate = DateInString.toDate("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        return tempDate?.toString("MMM dd, yyyy") ?? "Error"
    }
}
