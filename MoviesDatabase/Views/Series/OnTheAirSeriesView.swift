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
            .navigationTitle("On The Air Series")
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
