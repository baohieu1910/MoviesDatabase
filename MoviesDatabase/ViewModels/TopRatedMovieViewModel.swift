//
//  TopSeriesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import Foundation

class TopRatedMovieViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    var apiService: APIService = APIService()
    
    func getTopSeries() {
        apiService.getTopRatedMovie { movies in
            self.movies = movies
        }
    }
    
}
