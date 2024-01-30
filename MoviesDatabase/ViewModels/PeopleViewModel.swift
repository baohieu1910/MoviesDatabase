//
//  PeopleViewModel.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import Foundation

class PeopleViewModel: ObservableObject {
    @Published var people: People = People()
    var apiService: APIService = APIService()
    
    func getPeopleDetail(id: Int) {
        apiService.getcastDetail(id: id) { people in
            self.people = people
        }
    }
    
}
