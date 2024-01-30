//  MainVM
//  MoviesDatabase
//
//  Created by Hung Le on 1/30/24.
//

import Foundation

final public class MainVM: ObservableObject {
    enum Fullscreen: Identifiable {
        var id: String {
            switch self {
            default:
                return ""
            }
        }
    }
    
    // Public variable
    @Published var fullScreen: Fullscreen?
    @Published var moviesToday: [Movie] = [Movie]()
    @Published var moviesThisWeek: [Movie] = [Movie]()
    
    private lazy var apiService: APIService = APIService()
    // Private variable

    // Init
    init() {
        
    }
}

// MARK:- Public functions
public extension MainVM {
    func getMoviesToday() {
        apiService.getTrendingToday { movies in
            self.moviesToday = movies
        }
    }
    
    func getMoviesThisWeek() {
        apiService.getTrendingThisWeek { movies in
            self.moviesThisWeek = movies
        }
    }
}

// MARK:- Private functions
private extension MainVM {
    
}
