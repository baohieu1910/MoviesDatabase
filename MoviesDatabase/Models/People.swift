//
//  People.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import Foundation

struct People: Codable, Identifiable, Hashable {
    var id: Int
    var name: String?
    var knownFor: String?
    var biography: String?
    var birthday: String?
    var placeOfBirth: String?
    var profilePath: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case knownFor = "known_for_department"
        case biography
        case birthday
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
    
    struct Constants {
        static let baseImageUrl = "https://image.tmdb.org/t/p/"
        static let logoSize = "w45"
        static let largeImageSize = "w500"
        static let noProfileImage = "https://www.themoviedb.org/assets/2/v4/glyphicons/basic/glyphicons-basic-4-user-grey-d8fe957375e70239d6abdd549fd7568c89281b2179b5f4470e2e12895792dfa5.svg"
    
    }
    
    func getPeopleImage() -> String {
        if let profilePath = self.profilePath {
            return Constants.baseImageUrl + Constants.largeImageSize + profilePath
        } else {
            return Constants.noProfileImage
        }
    }
}
