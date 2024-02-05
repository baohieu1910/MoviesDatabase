//
//  NowPlayingMoviesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

class NowPlayingMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    private var page: Int = 1
    
    private lazy var apiService: APIService = APIService()
}

// MARK: Public functions
extension NowPlayingMoviesViewModel {
    func getNowPlayingMovies() {
        apiService.getNowPlayingMovies(page: page) { [weak self] movies in
            self?.movies = movies
        }
    }
}

// MARK: Private functions
private extension NowPlayingMoviesViewModel {
    
}
