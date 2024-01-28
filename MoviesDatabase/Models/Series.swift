//
//  TopSeries.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import Foundation

struct Series: Codable, Hashable, Identifiable {
    var id: String
    var position: Int
    var primaryImage: PrimaryImage
    var titleText: TitleText
    var releaseDate: ReleaseDate
    
    struct PrimaryImage: Codable, Hashable {
        var id: String
        var width: Int
        var height: Int
        var url: String
    }
    
    struct TitleText: Codable, Hashable {
        var text: String
    }
    
    struct ReleaseDate: Codable, Hashable {
        var day: Int
        var month: Int
        var year: Int
    }
    
    init() {
        id = "1"
        position = 0
        primaryImage = PrimaryImage(id: "1", width: 0, height: 0, url: "https://m.media-amazon.com/images/M/MV5BZGUzYTI3M2EtZmM0Yy00NGUyLWI4ODEtN2Q3ZGJlYzhhZjU3XkEyXkFqcGdeQXVyNTM0OTY1OQ@@._V1_.jpg")
        titleText = TitleText(text: "1")
        releaseDate = ReleaseDate(day: 0, month: 0, year: 0)
    }
}


