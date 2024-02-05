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
}
