//
//  Movie.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

#if DEBUG
extension Movie {
    static var testMovie: Movie {
        Movie(adult: true, backdropPath: "", genreIDS: [], id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 9, posterPath: "", releaseDate: "", title: "", video: nil, voteAverage: 9, voteCount: 9)
    }
}
#endif
