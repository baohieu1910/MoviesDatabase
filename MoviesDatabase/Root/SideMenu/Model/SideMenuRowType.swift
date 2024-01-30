//
//  SideMenuRowType.swift
//  MoviesDatabase
//
//  Created by Hung Le on 1/30/24.
//

import Foundation
enum SideMenuRowType: Int, CaseIterable {
    case home = 0
    case popular
    case topRated
    case nowPlaying
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .nowPlaying:
            return "Now Playing"
        }
    }
}
