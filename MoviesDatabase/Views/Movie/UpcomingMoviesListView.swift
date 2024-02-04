//
//  UpcomingMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct UpcomingMoviesListView: View {
    @ObservedObject var viewModel: UpcomingMoviesViewModel
    
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
        .onAppear {
            viewModel.getUpcomingMovies()
        }
    }
}

struct UpcomingMoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMoviesListView(viewModel: UpcomingMoviesViewModel())
    }
}
