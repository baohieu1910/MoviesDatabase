//
//  MovieDetail.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/1/24.
//

import Foundation
import SwiftUI

struct MovieDetail: Codable, Identifiable, Hashable {
    
    var backdropPath: String?
    var budget: Int?
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
    
    struct Constants {
        static let baseImageUrl = "https://image.tmdb.org/t/p/"
        static let logoSize = "w45"
        static let largeImageSize = "w500"
        static let backGroundImageSize = "w1920_and_h800_multi_faces"
        static let noImageName = "https://www.themoviedb.org/assets/2/v4/glyphicons/basic/glyphicons-basic-38-picture-grey-c2ebdbb057f2a7614185931650f8cee23fa137b93812ccb132b9df511df1cfac.svg"
    }
    
    func getMovieBackground() -> String {
        if let backdropPath = self.backdropPath {
            return Constants.baseImageUrl + Constants.backGroundImageSize + backdropPath
        }
        return Constants.noImageName
    }
    
    func getMoviePoster() -> String {
        if let posterPath = self.posterPath {
            return Constants.baseImageUrl + Constants.largeImageSize + posterPath
        }
        return Constants.noImageName
    }
    
    func getMovieLogo() -> String {
        if let posterPath = self.posterPath {
            return Constants.baseImageUrl + Constants.logoSize + posterPath
        }
        return Constants.noImageName
    }
    
    func getReleaseDate() -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let releaseDate = self.releaseDate {
            if let dateToDisplay = dateFormatter.date(from: releaseDate) {
                dateFormatter.dateFormat = "MMMM dd, yyyy"
                return dateFormatter.string(from: dateToDisplay)
            }
        }
        return "N/A"
    }
    
    func getBudget() -> Text {
        return Text(self.budget ?? 0, format: .currency(code: "USD").precision(.fractionLength(2)))
    }
    
    func getRevenue() -> Text {
        return Text(self.revenue ?? 0, format: .currency(code: "USD").precision(.fractionLength(2)))
    }
    
    
    
    
}
