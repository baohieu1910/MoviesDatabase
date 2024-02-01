//
//  BackgroundImage.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/31/24.
//

import Foundation
import SwiftUI

struct BackgroundImage {
    static let firstHomeImage: [String] = ["bg1_1", "bg1_2", "bg1_3", "bg1_4", "bg1_5", "bg1_6"]
    static let secondHomeImage: String = "bg2"
    
    static func getFirstHomeImage() -> Image {
        let imageName = firstHomeImage.randomElement()
        return Image(imageName ?? "bg1_1")
    }
    
    static func getSecondHomeImage() -> Image {
        return Image(secondHomeImage)
    }
}
