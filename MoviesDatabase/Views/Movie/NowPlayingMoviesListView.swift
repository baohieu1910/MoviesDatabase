//
//  NowPlayingMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct NowPlayingMoviesListView: View {
    @ObservedObject var viewModel: NowPlayingMoviesViewModel
    
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
            .navigationTitle("Now Playing Movies")
        }
        .onAppear() {
            viewModel.getNowPlayingMovies()
        }
    }
}

struct NowPlayingMoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingMoviesListView(viewModel: NowPlayingMoviesViewModel())
    }
}
