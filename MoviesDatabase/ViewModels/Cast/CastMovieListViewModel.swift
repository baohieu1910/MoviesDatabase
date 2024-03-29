//
//  CastMovieListViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

class CastMovieListViewModel: ObservableObject {
    @Published var casts: [Cast] = [Cast]()
    private lazy var apiService: APIService = APIService()
    
}

// MARK: Public functions
extension CastMovieListViewModel {
    func getCastList(id: Int) {
        apiService.getCastMovieList(id: id) { [weak self] casts in
            self?.casts = casts
        }
    }
}

// MARK: Private functions
private extension CastMovieListViewModel {
    
}
