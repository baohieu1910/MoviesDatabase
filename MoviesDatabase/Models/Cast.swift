//
//  Cast.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

struct Cast: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var profilePath: String?
    var character: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePath = "profile_path"
        case character
    }
    
    struct Constants {
        static let baseImageUrl = "https://image.tmdb.org/t/p/"
        static let logoSize = "w45"
        static let largeImageSize = "w500"
        static let noProfileImage = "https://www.themoviedb.org/assets/2/v4/glyphicons/basic/glyphicons-basic-4-user-grey-d8fe957375e70239d6abdd549fd7568c89281b2179b5f4470e2e12895792dfa5.svg"
    }
    
    func getCastImage() -> String {
        if let profilePath = self.profilePath {
            return Constants.baseImageUrl + Constants.largeImageSize + profilePath
        } else {
            return Constants.noProfileImage
        }
    }
    
}
