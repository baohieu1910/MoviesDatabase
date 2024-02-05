//
//  ContentView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView(viewModel: TrendingMovieViewModel())
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            MoviesListTypesView(viewModel: SearchMovieViewModel())
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            
            SeriesListTypesView(viewModel: SearchSeriesViewModel())
                .tabItem {
                    Label("TV Series", systemImage: "play.tv")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
