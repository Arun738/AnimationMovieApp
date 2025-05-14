//
//  DetailsMovieViewModel.swift
//  MovieApp
//
//  Created by Arun Tiwari on 13.05.2025.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieID = Int(movie.id ?? "") ?? 0
        self.movieTitle = movie.attributes?.titles?.en ?? movie.attributes?.abbreviatedTitles?.first ?? "Untitled"
        self.movieDescription = movie.attributes?.description ?? ""
        self.movieImage = URL(string: movie.attributes?.posterImage?.original ?? "")
        
    }
    
}

