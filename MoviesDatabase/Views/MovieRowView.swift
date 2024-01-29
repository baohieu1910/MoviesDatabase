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
    
    let width = UIScreen.screenWidth / 4
    let height = UIScreen.screenHeight / 6
    
    var body: some View {
        HStack {
            let url = URL(string: movie.getMoviePoster())
            AsyncImage(url: url) { image in
                ZStack(alignment: .bottomTrailing) {
                    image
                        .resizable()
                        .frame(width: width, height: height)
                        .cornerRadius(20)
                    
                    CircularProcessBarView(progress: movie.voteAverage / 10)
//                        .offset(x: width / 7, y: width / 7)
                }
                
            } placeholder: {
                Image("tmdb")
                    .resizable()
                    .frame(width: min(width, height), height: min(width, height))
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
            
            Spacer()
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView()
    }
}
