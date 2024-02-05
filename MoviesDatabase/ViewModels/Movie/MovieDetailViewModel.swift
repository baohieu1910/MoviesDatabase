//
//  MovieDetailViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/1/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movie: MovieDetail?
    private lazy var apiService: APIService = APIService()
}

// MARK: Public functions
extension MovieDetailViewModel {
    func getMovieDetail(id: Int) {
        apiService.getMovieDetail(id: id) { [weak self] movie in
            self?.movie = movie
        }
    }
}

// MARK: Private functions
private extension MovieDetailViewModel {
    
}
