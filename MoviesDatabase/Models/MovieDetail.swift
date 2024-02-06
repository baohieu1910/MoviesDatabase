//
//  MovieDetail.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/1/24.
//

import Foundation
import SwiftUI

struct Genres: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
}

struct MovieDetail: Codable, Identifiable, Hashable {
    var backdropPath: String?
    var budget: Int?
    var genres: [Genres]
    var id: Int
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var revenue: Int?
    var runtime: Int?
    var status: String?
    var tagline: String?
    var title: String?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case status
        case tagline
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
