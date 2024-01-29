//
//  TopSeriesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import Foundation

class TopRatedMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    @Published var page: Int = 1
    var apiService: APIService = APIService()
    
    func getTopSeries() {
        apiService.getTopRatedMovie(page: page) { movies in
//            self.movies += movies
//            self.page += 1
            self.movies = movies
        }
    }
    
}
