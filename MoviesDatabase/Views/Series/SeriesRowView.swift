//
//  SeriesRowView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct SeriesRowView: View {
    var series: Series
    
    var body: some View {
        let url = URL(string: Utils.getMoviePoster(posterPath: series.posterPath))
        AsyncImage(url: url) { image in
            HStack {
                ZStack(alignment: .bottomTrailing) {
                    image
                        .resizable()
                        .frame(width: 100, height: 150)
                        .cornerRadius(20)
                    
                    CircularProcessBarView(progress: (series.voteAverage ?? 0) / 10)
                }
                
                VStack(alignment: .leading) {
                    Text("\(series.name ?? "N/A")")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("\(Utils.getReleaseDate(releaseDate: series.releaseDate))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    Text("\(series.overview ?? "N/A")")
                        .lineLimit(2)
                        .truncationMode(.tail)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white)
            }
            .padding(.horizontal, 5)
        } placeholder: {
            ProgressView()
                .frame(height: 150)
        }
    }
}

struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView(series: ExampleData.series)
    }
}
