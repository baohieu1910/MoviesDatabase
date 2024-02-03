//
//  PopularMoviesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

class PopularMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    @Published var page: Int = 1
    var apiService: APIService = APIService()
    
    
}

// MARK: Public functions
extension PopularMoviesViewModel {
    func getPopularMovie() {
        apiService.getPopularMovie(page: page) { movies in
//            self.movies += movies
//            self.page += 1
            self.movies = movies
        }
    }
}

// MARK: Private functions
private extension PopularMoviesViewModel {
    
}
