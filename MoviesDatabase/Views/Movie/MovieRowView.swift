//
//  SeriesRowView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI
import UIKit

struct MovieRowView: View {
    var movie: Movie = Movie()
    
    var body: some View {
        HStack {
            let url = URL(string: movie.getMoviePoster())
            AsyncImage(url: url) { image in
                ZStack(alignment: .bottomTrailing) {
                    image
                        .resizable()
                        .frame(width: 100, height: 150)
                        .cornerRadius(20)
                    
                    CircularProcessBarView(progress: movie.voteAverage / 10)
                }
                
            } placeholder: {
                Image("tmdb")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading) {
                Text("\(movie.title)")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("\(movie.getReleaseDate())")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Text("\(movie.overview)")
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
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView()
    }
}
