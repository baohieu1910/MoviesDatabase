//
//  MoviesDatabaseApp.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/25/24.
//

import SwiftUI

@main
struct MoviesDatabaseApp: App {
    private let moviesVM = TopRatedMoviesViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(moviesVM)
        }
    }
}
