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
            .navigationTitle("Popular Movies")
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
