//
//  TopRatedSeriesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct TopRatedSeriesView: View {
    @ObservedObject var viewModel: TopRatedSeriesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.series) { series in
                    NavigationLink {
//                        MovieDetailView(castVM: CastListViewModel(), movieVM: MovieDetailViewModel(), movie: movie)
                        Text("Navigation")
                    } label: {
                        SeriesRowView(series: series)
                            .foregroundColor(.black)
                            .padding([.bottom, .horizontal])
                    }
                }
            }
            .navigationTitle("Top Rated")
        }
        .onAppear {
            viewModel.getTopRatedSeries()
        }
    }
}

struct TopRatedSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedSeriesView(viewModel: TopRatedSeriesViewModel())
    }
}
