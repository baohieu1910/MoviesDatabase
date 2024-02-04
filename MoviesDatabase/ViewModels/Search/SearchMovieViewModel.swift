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
    private var apiService: APIService = APIService()
    
    func getSearchMovies(name: String) {
        apiService.getSearchMoviesList(name: name) { movies in
            self.movies = movies
        }
    }
}
