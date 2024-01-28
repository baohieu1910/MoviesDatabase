//
//  MoviesDatabaseApp.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/25/24.
//

import SwiftUI

@main
struct MoviesDatabaseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TopSeriesViewModel())
        }
    }
}
