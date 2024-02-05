//
//  PopularSeriesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class PopularSeriesViewModel: ObservableObject {
    @Published var series: [Series] = [Series]()
    private var page: Int = 1
    
    private lazy var apiService: APIService = APIService()
}

extension PopularSeriesViewModel {
    func getPopularSeries() {
        apiService.getPopularSeries(page: page) { [weak self] series in
            self?.series = series
        }
    }
}

private extension PopularSeriesViewModel {
    
}
