//
//  SeriesDetailViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class SeriesDetailViewModel: ObservableObject {
    @Published var series: SeriesDetail?
    private var apiService: APIService = APIService()
    
    func getSeriesDetail(id: Int) {
        apiService.getSeriesDetail(id: id) { series in
            self.series = series
        }
    }
}
