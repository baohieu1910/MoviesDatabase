//
//  CastSeriesListViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/4/24.
//

import Foundation

class CastSeriesListViewModel: ObservableObject {
    @Published var casts: [Cast] = [Cast]()
    var apiService: APIService = APIService()
    
}

// MARK: Public functions
extension CastSeriesListViewModel {
    func getCastList(id: Int) {
        apiService.getCastSeriesList(id: id) { casts in
            self.casts = casts
        }
    }
}

// MARK: Private functions
private extension CastSeriesListViewModel {
    
}
