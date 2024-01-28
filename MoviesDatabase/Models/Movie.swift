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
    var overview: String
    var voteAverage: Double
    var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case title
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    struct Constants {
        static let baseImageUrl = "https://image.tmdb.org/t/p/"
        static let logoSize = "w45"
        static let largeImageSize = "w500"
    }
    
    init() {
        backdropPath = "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg"
        posterPath = "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"
        genreIds = [18, 80]
        id = 278
        originalLanguage = "en"
        title = "The Shawshank Redemption"
        overview = "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope."
        voteAverage = 8.711
        voteCount = 25436
    }
    
    func getMoviePoster() -> String {
        return Constants.baseImageUrl + Constants.largeImageSize + self.posterPath
    }
    
    func getMovieLogo() -> String {
        return Constants.baseImageUrl + Constants.logoSize + self.posterPath
    }
}

