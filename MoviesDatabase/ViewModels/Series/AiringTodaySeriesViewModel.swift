//
//  AiringTodaySeriesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import Foundation

class AiringTodaySeriesViewModel: ObservableObject {
    @Published var series = [Series]()
    private var page: Int = 1
    
    private lazy var apiService: APIService = APIService()
}

extension AiringTodaySeriesViewModel {
    func getAiringTodaySeries() {
        apiService.getAiringTodaySeries(page: page) { [weak self] series in
            self?.series = series
        }
    }
}

private extension AiringTodaySeriesViewModel {
    
}
