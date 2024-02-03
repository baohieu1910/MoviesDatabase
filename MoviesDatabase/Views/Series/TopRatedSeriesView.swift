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
                        SeriesDetailView(seriesVM: SeriesDetailViewModel(), castVM: CastSeriesListViewModel(), series: series)
                    } label: {
                        SeriesRowView(series: series)
                            .foregroundColor(.black)
                            .padding([.bottom, .horizontal])
                    }
                }
            }
            .navigationTitle("Top Rated Series")
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
