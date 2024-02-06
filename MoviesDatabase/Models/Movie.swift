//
//  Movie.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import Foundation

struct Movie: Codable, Identifiable, Hashable {
    var posterPath: String?
    var backdropPath: String?
    var id: Int
    var title: String?
    var releaseDate: String?
    var overview: String?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case id
        case releaseDate = "release_date"
        case title
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
