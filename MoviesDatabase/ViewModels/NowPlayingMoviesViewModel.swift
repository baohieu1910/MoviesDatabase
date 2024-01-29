//
//  NowPlayingMoviesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

class NowPlayingMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    @Published var page: Int = 1
    var apiService: APIService = APIService()
    
    func getNowPlayingMovies() {
        apiService.getNowPlayingMovies(page: page) { movies in
//            self.movies += movies
//            self.page += 1
            self.movies = movies
        }
    }
}
