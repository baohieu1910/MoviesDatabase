//
//  SeriesPopularViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class SeriesPopularViewModel: ObservableObject {
    @Published var series: [Series] = [Series]()
    @Published var page: Int = 1
    private var apiService: APIService = APIService()
    
    func getPopularSeries() {
        apiService.getPopularSeries(page: page) { series in
            self.series = series
        }
    }
}
