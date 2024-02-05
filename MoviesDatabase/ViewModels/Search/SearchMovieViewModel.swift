//
//  SearchMovieViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/4/24.
//

import Foundation

class SearchMovieViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    @Published var searchText: String = ""
    
    private lazy var apiService: APIService = APIService()
}

extension SearchMovieViewModel {
    func getSearchMovies(name: String) {
        apiService.getSearchMoviesList(name: name) { [weak self] movies in
            self?.movies = movies
        }
    }
}

private extension SearchMovieViewModel {
    
}
