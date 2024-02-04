//
//  TopRatedMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct TopRatedMoviesListView: View {
    @ObservedObject var viewModel: TopRatedMoviesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.movies) { movie in
                    NavigationLink {
                        MovieDetailView(castVM: CastMovieListViewModel(), movieVM: MovieDetailViewModel(), movie: movie)
                    } label: {
                        MovieCardView(movie: movie)
                    }
                }
            }
        }
        .onAppear() {
            viewModel.getTopSeries()
        }
    }
}

struct TopRatedMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedMoviesListView(viewModel: TopRatedMoviesViewModel())
    }
}
