//
//  SeriesDetail.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

struct SeriesDetail: Codable, Identifiable, Hashable {
    var backdropPath: String?
    var id: Int
    var originalLanguage: String?
    var originalName: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var status: String?
    var tagline: String?
    var type: String?
    var name: String?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "first_air_date"
        case status
        case tagline
        case type
        case name
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
