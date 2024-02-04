//
//  AiringTodaySeriesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct AiringTodaySeriesView: View {
    @ObservedObject var viewModel: AiringTodaySeriesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.series) { series in
                    NavigationLink {
                        SeriesDetailView(seriesVM: SeriesDetailViewModel(), castVM: CastSeriesListViewModel(), series: series)
                    } label: {
                        SeriesCardView(series: series)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getAiringTodaySeries()
        }
    }
}

struct AiringTodaySeriesView_Previews: PreviewProvider {
    static var previews: some View {
        AiringTodaySeriesView(viewModel: AiringTodaySeriesViewModel())
    }
}
