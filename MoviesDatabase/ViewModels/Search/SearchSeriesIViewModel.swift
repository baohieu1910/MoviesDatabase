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
    private var apiService: APIService = APIService()
    
    func getSearchSeries(name: String) {
        apiService.getSearchSeriesList(name: name) { series in
            self.series = series
        }
    }
}
