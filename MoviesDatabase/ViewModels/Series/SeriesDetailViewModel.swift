//
//  SeriesDetailViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class SeriesDetailViewModel: ObservableObject {
    @Published var series: SeriesDetail?
    
    private lazy var apiService: APIService = APIService()
}

extension SeriesDetailViewModel {
    func getSeriesDetail(id: Int) {
        apiService.getSeriesDetail(id: id) { [weak self] series in
            self?.series = series
        }
    }
}

private extension SeriesDetailViewModel {
    
}
