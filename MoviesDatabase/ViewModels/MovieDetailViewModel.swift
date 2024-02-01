//
//  MovieDetailViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/1/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movie: MovieDetail?
    var apiService: APIService = APIService()
    
    func getMovieDetail(id: Int) {
        apiService.getMovieDetail(id: id) { movie in
            self.movie = movie
        }
    }
}
