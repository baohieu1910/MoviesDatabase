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
                ZStack {
                    Image("Series")
                        .resizable()
                        .scaledToFit()
                        .scaledToFill()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                    
                    LinearGradient(colors: [.clear, .clear, .white], startPoint: .top, endPoint: .bottom)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Search your TV series", text: $viewModel.searchText)
                                .padding(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 90)
                                        .stroke(.gray)
                                }
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Welcome.")
                            .font(.custom("PlayfairDisplay-Bold", size: 50))
                        
                        Text("Millions of TV series to discover.")
                            .font(.custom("PlayfairDisplay-Bold", size: 30))
                        
                        Text("Explore now.")
                            .font(.custom("PlayfairDisplay-Bold", size: 30))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                }
                
                if viewModel.searchText == "" {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Popular")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))

                            PopularSeriesView(viewModel: popularVM)
                                .frame(height: 250)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Top Rated")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                            
                            TopRatedSeriesView(viewModel: topRatedVM)
                                .frame(height: 250)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Airing Today")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                            
                            AiringTodaySeriesView(viewModel: airingTodayVM)
                                .frame(height: 250)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("On The Air")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                            
                            OnTheAirSeriesView(viewModel: onTheAirVM)
                                .frame(height: 250)
                        }
                        .padding()
                    }
                } else {
                    ForEach(viewModel.series) { series in
                        NavigationLink {
                            SeriesDetailView(viewModel: SeriesDetailViewModel(), series: series)
                        } label: {
                            VStack {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(series.name ?? "N/A")")
                                            .lineLimit(1)
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                Divider()
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
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
