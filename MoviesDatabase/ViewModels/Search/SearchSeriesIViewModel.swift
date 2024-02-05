//
//  SearchSeriesIViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/4/24.
//

import Foundation

class SearchSeriesViewModel: ObservableObject {
    @Published var series: [Series] = [Series]()
    @Published var searchText: String = ""
    
    private lazy var apiService: APIService = APIService()
}

extension SearchSeriesViewModel {
    func getSearchSeries(name: String) {
        apiService.getSearchSeriesList(name: name) { [weak self] series in
            self?.series = series
        }
    }
}

private extension SearchSeriesViewModel {
    
}
