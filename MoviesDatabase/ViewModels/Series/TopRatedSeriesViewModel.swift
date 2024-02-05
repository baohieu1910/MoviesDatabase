//
//  TopRatedSeriesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class TopRatedSeriesViewModel: ObservableObject {
    @Published var series: [Series] = [Series]()
    private var page: Int = 1
    
    private lazy var apiService: APIService = APIService()
}

extension TopRatedSeriesViewModel {
    func getTopRatedSeries() {
        apiService.getTopRatedSeries(page: page) { [weak self] series in
            self?.series = series
        }
    }
}

private extension TopRatedSeriesViewModel {
    
}
