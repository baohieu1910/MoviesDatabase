//
//  KeywordSeriesListViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import Foundation

class KeywordSeriesListViewModel: ObservableObject {
    @Published var series: [Series] = []
    private lazy var apiService = APIService()
    
    func getSeriesList(id: Int) {
        apiService.getSeriesKeywordList(id: id) { [weak self] series in
            self?.series = series
        }
    }
}
