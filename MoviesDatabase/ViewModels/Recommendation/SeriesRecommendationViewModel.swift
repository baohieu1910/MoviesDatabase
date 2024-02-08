//
//  SeriesRecommendationViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/8/24.
//

import Foundation

class SeriesRecommendationViewModel: ObservableObject {
    @Published var series: [Series] = []
    private lazy var apiService = APIService()
    
    func getSeriesList(id: Int) {
        apiService.getSeriesRecommendation(id: id) { [weak self] series in
            self?.series = series
        }
    }
}
