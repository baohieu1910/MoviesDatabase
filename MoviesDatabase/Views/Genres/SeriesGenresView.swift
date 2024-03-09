//
//  SeriesGenresView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import SwiftUI

struct SeriesGenresView: View {
    @ObservedObject var viewModel: SeriesGenresViewModel
    var genres: Genres
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.series) { series in
                NavigationLink {
                    SeriesDetailView(viewModel: SeriesDetailViewModel(), series: series)
                } label: {
                    SeriesRowView(series: series)
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

struct SeriesGenresView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesGenresView(viewModel: SeriesGenresViewModel(), genres: Genres(id: 18, name: "Drama"))
    }
}

