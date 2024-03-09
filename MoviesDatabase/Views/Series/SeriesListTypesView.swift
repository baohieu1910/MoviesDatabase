//
//  SeriesListTypesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct SeriesListTypesView: View {
    @ObservedObject var viewModel: SearchSeriesViewModel
    @ObservedObject var popularVM = PopularSeriesViewModel()
    @ObservedObject var topRatedVM = TopRatedSeriesViewModel()
    @ObservedObject var airingTodayVM = AiringTodaySeriesViewModel()
    @ObservedObject var onTheAirVM = OnTheAirSeriesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                if viewModel.searchText == "" {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Popular")
                                .font(.title)
                                .bold()
                            
                            PopularSeriesView(viewModel: popularVM)
                                .frame(height: 300)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Top Rated")
                                .font(.title)
                                .bold()
                            
                            TopRatedSeriesView(viewModel: topRatedVM)
                                .frame(height: 300)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Airing Today")
                                .font(.title)
                                .bold()
                            
                            AiringTodaySeriesView(viewModel: airingTodayVM)
                                .frame(height: 300)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("On The Air")
                                .font(.title)
                                .bold()
                            
                            OnTheAirSeriesView(viewModel: onTheAirVM)
                                .frame(height: 300)
                        }
                        .padding()
                    }
                } else {
                    ForEach(viewModel.series) { series in
                        NavigationLink {
                            SeriesDetailView(viewModel: SeriesDetailViewModel(), series: series)
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
        .onAppear {
            popularVM.getPopularSeries()
            topRatedVM.getTopRatedSeries()
            airingTodayVM.getAiringTodaySeries()
            onTheAirVM.getOnTheAirSeries()
        }
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
