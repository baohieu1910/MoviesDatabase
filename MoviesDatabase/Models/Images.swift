//
//  Images.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/5/24.
//

import Foundation

struct Images: Codable, Identifiable, Hashable {
    var id = UUID()
    var filePath: String?
    
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
    private struct Constants {
        static let baseImageUrl = "https://image.tmdb.org/t/p/"
        static let logoSize = "w45"
        static let largeImageSize = "w500"
        static let backGroundImageSize = "w1920_and_h800_multi_faces"
        static let noImageName = "https://www.themoviedb.org/assets/2/v4/glyphicons/basic/glyphicons-basic-38-picture-grey-c2ebdbb057f2a7614185931650f8cee23fa137b93812ccb132b9df511df1cfac.svg"
    }
    
    func getImage() -> String{
        if let filePath = self.filePath {
            return Constants.baseImageUrl + Constants.backGroundImageSize + filePath
        }
        return Constants.noImageName
    }
}
