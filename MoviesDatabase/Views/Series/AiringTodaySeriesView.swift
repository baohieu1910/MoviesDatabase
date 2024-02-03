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
            .navigationTitle("Airing Today Series")
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
