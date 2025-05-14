//
//  TrendingMoviesModel.swift
//  MovieApp
//
//  Created by Arun Tiwari on 12.05.2025.
//

import Foundation



// MARK: - TrendingMovieModel
struct TrendingMovieModel: Codable {
    var results: [Movie]?
    var meta: WelcomeMeta?
    var links: WelcomeLinks?
    
    enum CodingKeys: String, CodingKey {
        case results = "data"
        case meta, links
    }
}

// MARK: - Datum
struct Movie: Codable {
    let id, type: String?
    let links: DatumLinks?
    let attributes: Attributes?
    let relationships: [String: Relationship]?
}

// MARK: - Attributes
struct Attributes: Codable {
    let createdAt, updatedAt, slug, synopsis: String?
    let description: String?
    let coverImageTopOffset: Int?
    let titles: Titles?
    let canonicalTitle: String?
    let abbreviatedTitles: [String]?
    let averageRating: String?
    let ratingFrequencies: [String: String]?
    let userCount, favoritesCount: Int?
    let startDate, endDate: String?
    let popularityRank, ratingRank: Int?
    let ageRating, ageRatingGuide, subtype, status: String?
    let tba: String?
    let posterImage: PosterImage?
    let coverImage: CoverImage?
    let episodeCount: Int?
    let episodeLength: Int?
    let totalLength: Int?
    let youtubeVideoID, showType: String?
    let nsfw: Bool?

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt, slug, synopsis, description, coverImageTopOffset, titles, canonicalTitle, abbreviatedTitles, averageRating, ratingFrequencies, userCount, favoritesCount, startDate, endDate, popularityRank, ratingRank, ageRating, ageRatingGuide, subtype, status, tba, posterImage, coverImage, episodeCount, episodeLength, totalLength
        case youtubeVideoID = "youtubeVideoId"
        case showType, nsfw
    }
}

// MARK: - CoverImage
struct CoverImage: Codable {
    let tiny, large, small: String?
    let original: String?
    let meta: CoverImageMeta?
}

// MARK: - CoverImageMeta
struct CoverImageMeta: Codable {
    let dimensions: Dimensions?
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let tiny, large, small, medium: Large?
}

// MARK: - Large
struct Large: Codable {
    let width, height: Int?
}

// MARK: - PosterImage
struct PosterImage: Codable {
    let tiny, large, small, medium: String?
    let original: String?
    let meta: CoverImageMeta?
}

// MARK: - Titles
struct Titles: Codable {
    let en, enJp, jaJp, enUs: String?

    enum CodingKeys: String, CodingKey {
        case en
        case enJp = "en_jp"
        case jaJp = "ja_jp"
        case enUs = "en_us"
    }
}

// MARK: - DatumLinks
struct DatumLinks: Codable {
    let linksSelf: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Relationship
struct Relationship: Codable {
    let links: RelationshipLinks?
}

// MARK: - RelationshipLinks
struct RelationshipLinks: Codable {
    let linksSelf, related: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case related
    }
}

// MARK: - WelcomeLinks
struct WelcomeLinks: Codable {
    let first, next, last: String?
}

// MARK: - WelcomeMeta
struct WelcomeMeta: Codable {
    let count: Int?
}
