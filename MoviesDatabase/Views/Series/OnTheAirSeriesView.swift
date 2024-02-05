//
//  OnTheAirSeriesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct OnTheAirSeriesView: View {
    @ObservedObject var viewModel: OnTheAirSeriesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.series) { series in
                    NavigationLink {
                        SeriesDetailView(viewModel: SeriesDetailViewModel(), series: series)
                    } label: {
                        SeriesCardView(series: series)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getOnTheAirSeries()
        }
    }
}

struct OnTheAirSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        OnTheAirSeriesView(viewModel: OnTheAirSeriesViewModel())
    }
}
