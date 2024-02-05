//
//  PeopleViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import Foundation

class PeopleViewModel: ObservableObject {
    @Published var people: People?
    private lazy var apiService: APIService = APIService()
    
    init() {
        
    }
}

// MARK: Public functions
extension PeopleViewModel {
    func getPeopleDetail(id: Int) {
        apiService.getCastDetail(id: id) { [weak self] people in
            self?.people = people
        }
    }
}

// MARK: Private functions
private extension PeopleViewModel {
    
}
