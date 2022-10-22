//
//  MovieService.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation

// API
let baseApiURL = "https://api.themoviedb.org/3"
let APIKey = "fd99578f5667a6cec7e3d7c789f7175f"

// Movies
let baseImageURL = "https://image.tmdb.org/t/p"

//GET Movie
enum GetMovieType: String{
    case NowPlaying = "/now_playing"
    case Popular = "/popular"
    case TopRated = "/top_rated"
    case Upcoming = "/upcoming"
}

//GET Image
enum GetImageType: String{
    case smallPoster = "/w92"
    case mediumPoster = "/w154"
    case backdrop = "/w300"
}
