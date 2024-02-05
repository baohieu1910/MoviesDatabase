//
//  UpcomingMoviesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class UpcomingMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    private var page: Int = 1
    
    private lazy var apiService: APIService = APIService()
}

extension UpcomingMoviesViewModel {
    func getUpcomingMovies() {
        apiService.getUpcomingMovie(page: page) { [weak self] movies in
            self?.movies = movies
        }
    }
}

private extension UpcomingMoviesViewModel {
    
}
