//
//  PopularMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct PopularMoviesListView: View {
    @ObservedObject var viewModel: PopularMoviesViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.movies) { movie in
                    NavigationLink {
                        MovieDetailView(castVM: CastMovieListViewModel(), movieVM: MovieDetailViewModel(), imageVM: ImagesViewModel(), movie: movie)
                    } label: {
                        MovieCardView(movie: movie)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getPopularMovie()
        }
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesListView(viewModel: PopularMoviesViewModel())
    }
}


