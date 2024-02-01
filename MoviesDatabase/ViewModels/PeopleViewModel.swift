//
//  PeopleViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import Foundation

class PeopleViewModel: ObservableObject {
    @Published var people: People?
    var apiService: APIService = APIService()
    
    init() {
        
    }
    
    func getPeopleDetail(id: Int) {
        apiService.getCastDetail(id: id) { people in
            self.people = people
        }
    }
    
}
