//
//  OnTheAirSeriesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class OnTheAirSeriesViewModel: ObservableObject {
    @Published var series: [Series] = [Series]()
    private var page: Int = 1
    
    private lazy var apiService: APIService = APIService()
}

extension OnTheAirSeriesViewModel {
    func getOnTheAirSeries() {
        apiService.getOnTheAirSeries(page: page) { [weak self] series in
            self?.series = series
        }
    }
}

private extension OnTheAirSeriesViewModel {
    
}
