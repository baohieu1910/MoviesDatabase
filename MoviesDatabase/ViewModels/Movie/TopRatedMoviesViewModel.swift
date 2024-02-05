//
//  TopSeriesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import Foundation

class TopRatedMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    private var page: Int = 1
    
    private lazy var apiService: APIService = APIService()
}

// MARK: Public functions
extension TopRatedMoviesViewModel {
    func getTopSeries() {
        apiService.getTopRatedMovie(page: page) { [weak self] movies in
            self?.movies = movies
        }
    }
}

// MARK: Private functions
private extension TopRatedMoviesViewModel {
    
}
