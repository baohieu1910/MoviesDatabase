//
//  TrendingMovieViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import Foundation

class TrendingMovieViewModel: ObservableObject {
    @Published var moviesToday: [Movie] = [Movie]()
    @Published var moviesThisWeek: [Movie] = [Movie]()
    
    private lazy var apiService: APIService = APIService()
}

// MARK: Public functions
extension TrendingMovieViewModel {
    func getMoviesToday() {
        apiService.getTrendingToday { [weak self] movies in
            self?.moviesToday = movies
        }
    }
    
    func getMoviesThisWeek() {
        apiService.getTrendingThisWeek { [weak self] movies in
            self?.moviesThisWeek = movies
        }
    }
}

// MARK: Private functions
private extension TrendingMovieViewModel {
    
}
