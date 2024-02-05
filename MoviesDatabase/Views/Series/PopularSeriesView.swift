//
//  PopularSeriesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct PopularSeriesView: View {
    @ObservedObject var viewModel: PopularSeriesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.series) { series in
                    NavigationLink {
                        SeriesDetailView(seriesVM: SeriesDetailViewModel(), castVM: CastSeriesListViewModel(), imageVM: ImagesViewModel(), series: series)
                    } label: {
                        SeriesCardView(series: series)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getPopularSeries()
        }
    }
}

struct PopularSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularSeriesView(viewModel: PopularSeriesViewModel())
    }
}
