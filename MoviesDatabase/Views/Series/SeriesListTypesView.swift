//
//  SeriesListTypesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct SeriesListTypesView: View {
    @ObservedObject var viewModel: SearchSeriesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.searchText == "" {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Popular")
                                .font(.title)
                                .bold()
                            
                            PopularSeriesView(viewModel: PopularSeriesViewModel())
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Top Rated")
                                .font(.title)
                                .bold()
                            
                            TopRatedSeriesView(viewModel: TopRatedSeriesViewModel())
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Airing Today")
                                .font(.title)
                                .bold()
                            
                            AiringTodaySeriesView(viewModel: AiringTodaySeriesViewModel())
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("On The Air")
                                .font(.title)
                                .bold()
                            
                            OnTheAirSeriesView(viewModel: OnTheAirSeriesViewModel())
                        }
                        .padding()
                    }
                } else {
                    ForEach(viewModel.series) { series in
                        NavigationLink {
                            SeriesDetailView(seriesVM: SeriesDetailViewModel(), castVM: CastSeriesListViewModel(), imageVM: ImagesViewModel(), series: series)
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(series.name ?? "N/A")")
                                        .lineLimit(1)
                                    Divider()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Series")
        }
        .searchable(text: $viewModel.searchText)
        .onChange(of: viewModel.searchText, perform: { newValue in
            viewModel.getSearchSeries(name: viewModel.searchText)
        })
    }
}

struct SeriesListTypesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListTypesView(viewModel: SearchSeriesViewModel())
    }
}
