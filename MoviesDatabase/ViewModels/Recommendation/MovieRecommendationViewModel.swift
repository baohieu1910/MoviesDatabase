//
//  MovieRecommendationViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import Foundation

class MovieRecommendationViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private lazy var apiService = APIService()
    
    func getMovieList(id: Int) {
        apiService.getMovieRecommendation(id: id) { [weak self] movies in
            self?.movies = movies
        }
    }
}
