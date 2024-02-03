//
//  UpcomingMoviesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class UpcomingMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    @Published var page: Int = 1
    private var apiService: APIService = APIService()
    
    func getUpcomingMovies() {
        apiService.getUpcomingMovie(page: page) { movies in
            self.movies = movies
        }
    }
    
}
