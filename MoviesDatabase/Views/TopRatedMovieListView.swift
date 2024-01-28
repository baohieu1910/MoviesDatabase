//
//  TopSeriesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct TopRatedMovieListView: View {
    @EnvironmentObject var viewModel: TopRatedMovieViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(value: movie) {
                        MovieRowView(movie: movie)
                    }
                }
            }
            .onAppear() {
                viewModel.getTopSeries()
            }
//            .navigationTitle("Top 250 TV Series")
            .navigationTitle("Top \(viewModel.movies.count) Series")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
            }
        }
    }
}

struct TopRatedMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedMovieListView()
            .environmentObject(TopRatedMovieViewModel())
    }
}
