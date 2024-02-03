//
//  Series.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

struct Series: Codable, Identifiable, Hashable {
    var backdropPath: String
    var posterPath: String
    var id: Int
    var title: String
    var releaseDate: String
    var overview: String
    var voteAverage: Double
    var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case id
        case releaseDate = "release_date"
        case title
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    struct Constants {
        static let baseImageUrl = "https://image.tmdb.org/t/p/"
        static let logoSize = "w45"
        static let largeImageSize = "w500"
        static let backGroundImageSize = "w1920_and_h800_multi_faces"

    }
    
    func getMovieBackground() -> String {
        return Constants.baseImageUrl + Constants.backGroundImageSize + self.backdropPath
    }
    
    func getMoviePoster() -> String {
        return Constants.baseImageUrl + Constants.largeImageSize + self.posterPath
    }
    
    func getMovieLogo() -> String {
        return Constants.baseImageUrl + Constants.logoSize + self.posterPath
    }
    
    func getReleaseDate() -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let dateToDisplay = dateFormatter.date(from: releaseDate) {
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            return dateFormatter.string(from: dateToDisplay)
        }
        return "N/A"
    }
}
