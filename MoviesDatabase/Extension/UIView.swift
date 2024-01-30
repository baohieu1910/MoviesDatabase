//
//  UIView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import Foundation
import SwiftUI
import UIKit

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
