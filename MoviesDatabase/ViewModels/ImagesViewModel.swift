//
//  ImagesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/5/24.
//

import Foundation

class ImagesViewModel: ObservableObject {
    @Published var images: [Images] = [Images]()
    private var apiService: APIService = APIService()
    
    func getMovieImages(id: Int) {
        apiService.getMovieImages(id: id) { images in
            self.images = images
        }
    }
    
    func getSeriesImages(id: Int) {
        apiService.getSeriesImages(id: id) { images in
            self.images = images
        }
    }
}

