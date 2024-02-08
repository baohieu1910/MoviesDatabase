//
//  Series.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

struct Series: Codable, Identifiable, Hashable {
    var posterPath: String?
    var backdropPath: String?
    var id: Int
    var name: String?
    var releaseDate: String?
    var overview: String?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case id
        case releaseDate = "first_air_date"
        case name
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
