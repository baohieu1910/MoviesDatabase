//
//  SeriesRowView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI
import UIKit

struct MovieRowView: View {
    var movie: Movie
    
    var body: some View {
        let url = URL(string: Utils.getMoviePoster(posterPath: movie.posterPath))
        AsyncImage(url: url) { image in
            HStack {
            ZStack(alignment: .bottomTrailing) {
                image
                    .resizable()
                    .frame(width: 100, height: 150)
                    .cornerRadius(20)
                
                CircularProcessBarView(progress: (movie.voteAverage ?? 0) / 10)
            }
                
                VStack(alignment: .leading) {
                    Text("\(movie.title ?? "N/A")")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("\(Utils.getReleaseDate(releaseDate: movie.releaseDate))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    Text("\(movie.overview ?? "N/A")")
                        .lineLimit(2)
                        .truncationMode(.tail)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 2)
            
        } placeholder: {
            ProgressView()
                .frame(height: 150)
        }
            
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: ExampleData.movie)
    }
}
