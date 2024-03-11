//
//  SeriesCardView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/4/24.
//

import SwiftUI

struct SeriesCardView: View {
    var series: Series
    
    var body: some View {
        let url = URL(string: Utils.getMoviePoster(posterPath: series.posterPath))
        AsyncImage(url: url) { image in
            VStack {
                ZStack {
                    image
                        .resizable()
                        .frame(width: 140, height: 200)
                        .cornerRadius(5)
                    
                    CircularProcessBarView(progress: (series.voteAverage ?? 0) / 10)
                        .offset(x: -50, y: 100)
                }
                
                Spacer()
                
                VStack {
                    Text("\(series.name ?? "N/A")")
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(.white)
                    
                    
                    Text("\(Utils.getReleaseDate(releaseDate: series.releaseDate))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                }
            }
            .frame(width: 140, height: 260)
            .padding([.trailing])
        } placeholder: {
            ProgressView()
                .frame(width: 140, height: 260)
        }
            
    }
}

struct SeriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesCardView(series: ExampleData.series)
    }
}
