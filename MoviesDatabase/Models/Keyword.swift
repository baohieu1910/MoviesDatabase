//
//  Keyword.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import Foundation

struct Keyword: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
