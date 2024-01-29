//
//  PopularMoviesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

class PopularMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    var apiService: APIService = APIService()
    
    func getPopularMovie() {
        apiService.getPopularMovie { movies in
            self.movies = movies
        }
    }
}