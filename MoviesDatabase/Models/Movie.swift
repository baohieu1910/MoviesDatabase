//
//  TopSeries.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import Foundation

struct Movie: Codable, Identifiable, Hashable {
    var backdropPath: String
    var posterPath: String
    var genreIds: [Int]
    var id: Int
    var originalLanguage: String
    var title: String
    var releaseDate: String
    var overview: String
    var voteAverage: Double
    var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
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
    
    init() {
        backdropPath = "/cnqwv5Uz3UW5f086IWbQKr3ksJr.jpg"
        posterPath = "/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg"
        genreIds = [28, 12, 14]
        id = 572802
        originalLanguage = "en"
        title = "Aquaman and the Lost Kingdom"
        releaseDate = "2023-12-20"
        overview = "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction."
        voteAverage = 6.904
        voteCount = 925
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

