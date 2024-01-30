//
//  CastListViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import Foundation

class CastListViewModel: ObservableObject {
    @Published var casts: [Cast] = [Cast]()
    var apiService: APIService = APIService()
    
    func getCastList(id: Int) {
        apiService.getCastList(id: id) { casts in
            self.casts = casts
        }
    }
}
