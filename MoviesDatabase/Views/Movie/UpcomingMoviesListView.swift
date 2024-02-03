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
        NavigationView {
            ScrollView {
                ForEach(viewModel.movies) { movie in
                    NavigationLink {
                        MovieDetailView(castVM: CastMovieListViewModel(), movieVM: MovieDetailViewModel(), movie: movie)
                    } label: {
                        MovieRowView(movie: movie)
                            .foregroundColor(.black)
                            .padding([.bottom, .horizontal])
                    }
                }
            }
            .navigationTitle("Upcoming Movies")
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
