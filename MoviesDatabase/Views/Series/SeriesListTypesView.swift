//
//  SeriesListTypesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct SeriesListTypesView: View {
    @State private var type = "Popular"
    private let types = ["Popular", "Airing Today", "On The Air", "Top Rated"]
    
    var body: some View {
        VStack {
            Picker("Types", selection: $type) {
                ForEach(types, id: \.self) { type in
                    Text("\(type)")
                }
            }.pickerStyle(.segmented)
            
            if type == types[0] {
                PopularSeriesView(viewModel: PopularSeriesViewModel())
            } else if type == types[1] {
                AiringTodaySeriesView(viewModel: AiringTodaySeriesViewModel())
            } else if type == types[2] {
                OnTheAirSeriesView(viewModel: OnTheAirSeriesViewModel())
            } else if type == types[3] {
                TopRatedSeriesView(viewModel: TopRatedSeriesViewModel())
            }
        }
    }
}

struct SeriesListTypesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListTypesView()
    }
}
