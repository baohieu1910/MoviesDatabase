//
//  SeriesOnTheAirViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class SeriesOnTheAirViewModel: ObservableObject {
    @Published var series: [Series] = [Series]()
    @Published var page: Int = 1
    private var apiService: APIService = APIService()
    
    func getOnTheAirSeries() {
        apiService.getOnTheAirSeries(page: page) { series in
            self.series = series
        }
    }
}
