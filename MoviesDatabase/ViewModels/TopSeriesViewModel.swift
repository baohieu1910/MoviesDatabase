//
//  TopSeriesViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import Foundation

class TopSeriesViewModel: ObservableObject {
    @Published var topSeries: [Series] = []
    var apiService: APIService = APIService()
    
    func getTopSeries() {
        apiService.getData { topSeries in
            print("Done")
            print(topSeries)
            self.topSeries = topSeries
        }
    }
    
}
