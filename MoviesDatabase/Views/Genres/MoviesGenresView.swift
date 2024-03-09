//
//  MoviesGenresView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import SwiftUI

struct MoviesGenresView: View {
    @ObservedObject var viewModel: MovieGenresViewModel
    var genres: Genres
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.movies) { movie in
                NavigationLink {
                    MovieDetailView(viewModel: MovieDetailViewModel(), movie: movie)
                } label: {
                    MovieRowView(movie: movie)
                }

            }
        }
        .padding(.horizontal)
        .navigationTitle("\(genres.name)")
        .onAppear {
            viewModel.getMovieList(id: genres.id)
        }
    }
}

struct MoviesGenresView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesGenresView(viewModel: MovieGenresViewModel(), genres: Genres(id: 18, name: "Drama"))
    }
}
