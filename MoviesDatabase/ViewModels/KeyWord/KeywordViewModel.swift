//
//  KeywordViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import Foundation

class KeywordViewModel: ObservableObject {
    @Published var keywords: [Keyword] = []
    private lazy var apiService = APIService()
    
    func getMovieKeyWord(id: Int) {
        apiService.getMovieKeyword(id: id) { [weak self] keywords in
            self?.keywords = keywords
        }
    }
}
