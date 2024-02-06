//
//  SeriesGenresViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import Foundation

class SeriesGenresViewModel: ObservableObject {
    @Published var series: [Series] = []
    private lazy var apiService = APIService()
    
    func getMovieList(id: Int) {
        apiService.getSeriesGenres(id: id) { [weak self] series in
            self?.series = series
        }
    }
}
