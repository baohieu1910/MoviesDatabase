//
//  NowPlayingMoviesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

class NowPlayingMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    var apiService: APIService = APIService()
    
    func getNowPlayingMovies() {
        apiService.getNowPlayingMovies { movies in
            self.movies = movies
        }
    }
}
