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
            
            MoviesListTypesView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            
            
            SeriesListTypesView()
                .tabItem {
                    Label("TV Series", systemImage: "play.tv")
                }
            
            
            SearchView(viewModel: SearchMovieViewModel())
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
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
