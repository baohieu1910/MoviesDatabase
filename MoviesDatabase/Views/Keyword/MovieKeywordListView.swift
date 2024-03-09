//
//  MovieKeywordListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import SwiftUI

struct MovieKeywordListView: View {
    @ObservedObject var viewModel: KeywordMovieListViewModel
    var keyword: Keyword
    
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
        .navigationTitle("\(keyword.name)")
        .onAppear {
            viewModel.getMovieList(id: keyword.id)
        }
    }
}

struct MovieKeywordListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieKeywordListView(viewModel: KeywordMovieListViewModel(), keyword: Keyword(id: 9715, name: "superhero"))
    }
}
