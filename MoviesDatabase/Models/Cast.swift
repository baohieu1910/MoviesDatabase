//
//  Cast.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

struct Cast: Codable, Identifiable, Hashable {
    var id: Int
    var name: String?
    var profilePath: String?
    var character: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePath = "profile_path"
        case character
    }
}
