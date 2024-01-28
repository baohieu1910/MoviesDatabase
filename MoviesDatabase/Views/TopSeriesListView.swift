//
//  TopSeriesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct TopSeriesListView: View {
    @EnvironmentObject var viewModel: TopSeriesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.topSeries) { series in
                    NavigationLink(value: series) {
                        SeriesRowView(series: series)
                    }
                }
            }
            .onAppear() {
                viewModel.getTopSeries()
            }
            .navigationTitle("Top 250 TV Series")
            .navigationDestination(for: Series.self) { series in
                SeriesDetailView(series: series)
            }
        }
    }
}

struct TopSeriesListView_Previews: PreviewProvider {
    static var previews: some View {
        TopSeriesListView()
            .environmentObject(TopSeriesViewModel())
    }
}
