//
//  MovieTableCellViewModel.swift
//  MovieApp
//
//  Created by Arun Tiwari on 12.05.2025.
//

import Foundation

class MovieTableCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = Int(movie.id ?? "") ?? 0
        self.title = movie.attributes?.titles?.en
            ?? movie.attributes?.abbreviatedTitles?.first
            ?? "Untitled"
        self.date = movie.attributes?.startDate ?? movie.attributes?.endDate ?? ""
        
        //  Convert rating from 100 scale to 10 scale
        if let avgRatingStr = movie.attributes?.averageRating,
           let avgRating = Double(avgRatingStr) {
            let scaledRating = avgRating / 10
            self.rating = String(format: "%.1f/10", scaledRating)
        } else {
            self.rating = "N/A"
        }
        
        self.imageUrl = URL(string: movie.attributes?.posterImage?.original ?? "")
    }
    
}
