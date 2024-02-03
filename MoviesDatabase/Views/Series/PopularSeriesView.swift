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
            .navigationTitle("Popular")
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
