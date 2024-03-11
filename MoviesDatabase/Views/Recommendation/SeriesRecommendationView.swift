//
//  SeriesRecommendationView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/8/24.
//

import SwiftUI

struct SeriesRecommendationView: View {
    @ObservedObject var viewModel: SeriesRecommendationViewModel
    var series: Series
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommendations")
                .font(.title3)
                .fontWeight(.bold)
            
            if viewModel.series == [] {
                Text("We don't have enough data to suggest any movies based on \(series.name  ?? "N/A"). You can help by rating movies you've seen.")
                    .padding(.horizontal)
                    .foregroundColor(.black)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.series) { series in
                            let url = URL(string: Utils.getMovieBackground(backdropPath: series.backdropPath))
                            AsyncImage(url: url) { image in
                                NavigationLink {
                                    SeriesDetailView(viewModel: SeriesDetailViewModel(), series: series)
                                } label: {
                                    VStack(alignment: .leading) {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 250, height: 150, alignment: .center)
                                            .clipped()
                                            .cornerRadius(10)
                                        
                                        HStack {
                                            Text("\(series.name ?? "N/A")")
                                                .lineLimit(1)
                                            
                                            Spacer()
                                            
                                            Text("\(Int((series.voteAverage ?? 0) * 10))%")
                                        }
                                    }
                                    .frame(width: 250)
                                }
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 250, height: 150)
                            }
                        }
                    }
                    .frame(height: 170)
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.getSeriesList(id: series.id)
        }
        
    }
}

struct SeriesRecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRecommendationView(viewModel: SeriesRecommendationViewModel(), series: ExampleData.series)
    }
}
