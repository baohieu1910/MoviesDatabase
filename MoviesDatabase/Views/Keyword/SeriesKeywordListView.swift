//
//  SeriesKeywordListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import SwiftUI

struct SeriesKeywordListView: View {
    @ObservedObject var viewModel: KeywordSeriesListViewModel
    var keyword: Keyword
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.series) { series in
                NavigationLink {
                    SeriesDetailView(viewModel: SeriesDetailViewModel(), series: series)
                } label: {
                    SeriesRowView(series: series)
                }

            }
        }
        .padding(.horizontal)
        .navigationTitle("\(keyword.name)")
        .onAppear {
            viewModel.getSeriesList(id: keyword.id)
        }
    }
}

struct SeriesKeywordListView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesKeywordListView(viewModel: KeywordSeriesListViewModel(), keyword: Keyword(id: 1508, name: "new mexico"))
    }
}
